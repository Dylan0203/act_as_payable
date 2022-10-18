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
require 'rails_helper'

module ActAsSubscriptable
  RSpec.describe PaymentGateway, type: :model do
    # associations
    it { should have_many(:payment_methods) }
  end
end
