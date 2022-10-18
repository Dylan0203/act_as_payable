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
FactoryBot.define do
  factory :payment_method, class: 'ActAsSubscriptable::PaymentMethod' do
    payment_gateway

    name { 'PaymentMethod name' }
    description { 'PaymentMethod description' }
  end
end
