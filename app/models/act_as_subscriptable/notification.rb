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
module ActAsSubscriptable
  class Notification < ApplicationRecord
    belongs_to :payment

    enum notify_type: {
      init: 0,
      paid: 1,
      failed: 2,
      canceled: 3,
      unknown: 4
    }
  end
end
