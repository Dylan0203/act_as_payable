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
require 'rails_helper'

module ActAsSubscriptable
  RSpec.describe Payment, type: :model do
    # associations
    it { should belong_to(:subscription) }
    it { should belong_to(:payment_method) }
  end
end
