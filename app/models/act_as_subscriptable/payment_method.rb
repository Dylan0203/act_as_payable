# == Schema Information
#
# Table name: act_as_subscriptable_payment_methods
#
#  id                 :integer          not null, primary key
#  payment_gateway_id :integer
#  name               :string
#  description        :text
#  payment_type       :integer
#  enabled            :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
module ActAsSubscriptable
  class PaymentMethod < ApplicationRecord
    belongs_to :payment_gateway

    enum payment_type: { subscription: 0, pay_by_credit_card_token: 1 }
  end
end
