class CreateActAsSubscriptableNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :act_as_subscriptable_notifications do |t|
      t.references :payment,
                    index: { name: 'index_aas_notifications_on_payment_id' },
                    foreign_key: { to_table: 'act_as_subscriptable_payments' }
      t.jsonb :raw_data
      t.integer :notify_type, default: 0

      t.timestamps
    end
  end
end
