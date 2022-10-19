class CreateActAsSubscriptablePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :act_as_subscriptable_payments do |t|
      t.references :subscription,
                    index: { name: 'index_aas_payments_on_subscription_id' },
                    foreign_key: { to_table: 'act_as_subscriptable_subscriptions' }
      t.references :payment_method,
                    index: { name: 'index_aas_payments_on_payment_method_id' },
                    foreign_key: { to_table: 'act_as_subscriptable_payment_methods' }
      t.string :merchant_order_number
      t.datetime :notification_sent_at
      t.datetime :started_at
      t.datetime :ended_at
      t.string :state
      t.monetize :amount, default: 0
      t.column :gateway_info, :jsonb, default: {}

      t.timestamps
    end
  end
end
