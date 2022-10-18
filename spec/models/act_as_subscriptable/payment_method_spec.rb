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
require 'rails_helper'

module ActAsSubscriptable
  RSpec.describe PaymentMethod, type: :model do
    # associations
    it { should belong_to(:payment_gateway) }
  end
end
