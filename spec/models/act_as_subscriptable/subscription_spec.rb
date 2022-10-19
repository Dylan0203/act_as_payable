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
require 'rails_helper'

module ActAsSubscriptable
  RSpec.describe Subscription, type: :model do
    # associations
    it { should have_many(:payments) }
  end
end
