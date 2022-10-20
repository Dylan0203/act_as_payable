# == Schema Information
#
# Table name: act_as_subscriptable_subscriptions
#
#  id                   :bigint           not null, primary key
#  subscriptable_type   :string
#  subscriptable_id     :bigint
#  subscriber_type      :string
#  subscriber_id        :bigint
#  title                :string
#  description          :text
#  period_type          :integer          default("years")
#  period_point         :integer          default(1)
#  amount_cents         :integer          default(0), not null
#  amount_currency      :string           default("USD"), not null
#  grace_period_in_days :integer          default(0)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
module ActAsSubscriptable
  class Subscription < ApplicationRecord
    has_many :payments

    enum period_type: { days: 0, weeks: 1, months: 2, years: 3 }

    def is_active
      Rails.cache.fetch(cache_key_with_version) do
        payments.
          paid.
          where(
            'act_as_subscriptable_payments.ended_at >= ?',
            Time.current - grace_period_in_days.days
          ).
          exists?
      end
    end
  end
end
