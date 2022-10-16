# == Schema Information
#
# Table name: act_as_subscriptable_payment_gateways
#
#  id               :integer          not null, primary key
#  name             :string
#  gateway_provider :string
#  gateway_info     :json
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
module ActAsSubscriptable
  class PaymentGateway < ApplicationRecord
  end
end
