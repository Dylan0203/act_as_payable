class CreateActAsSubscriptablePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :act_as_subscriptable_payment_methods do |t|
      t.references :payment_gateway,
                   index: { name: 'index_aas_payment_methods_on_payment_gateway_id' },
                   foreign_key: { to_table: 'act_as_subscriptable_payment_gateways' }
      t.string :name
      t.text :description
      t.integer :payment_type
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
