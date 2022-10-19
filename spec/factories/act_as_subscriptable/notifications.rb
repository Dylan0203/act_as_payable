# == Schema Information
#
# Table name: act_as_subscriptable_notifications
#
#  id          :bigint           not null, primary key
#  payment_id  :bigint
#  raw_data    :jsonb
#  notify_type :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :notification, class: 'ActAsSubscriptable::Notification' do
    payment
  end
end
