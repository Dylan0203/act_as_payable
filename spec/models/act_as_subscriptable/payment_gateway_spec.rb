# == Schema Information
#
# Table name: act_as_subscriptable_payment_gateways
#
#  id               :bigint           not null, primary key
#  name             :string
#  gateway_provider :string
#  gateway_info     :jsonb
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
