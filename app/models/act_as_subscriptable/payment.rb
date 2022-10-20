# == Schema Information
#
# Table name: act_as_subscriptable_payments
#
#  id                    :bigint           not null, primary key
#  subscription_id       :bigint
#  payment_method_id     :bigint
#  merchant_order_number :string
#  notification_sent_at  :datetime
#  started_at            :datetime
#  ended_at              :datetime
#  state                 :string
#  amount_cents          :integer          default(0), not null
#  amount_currency       :string           default("USD"), not null
#  gateway_info          :jsonb
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
module ActAsSubscriptable
  class Payment < ApplicationRecord
    include AASM

    belongs_to :subscription
    belongs_to :payment_method

    aasm(column: :state) do
      state :init, initial: true
      state :paid
      state :failed
      state :canceled
    end
  end
end
