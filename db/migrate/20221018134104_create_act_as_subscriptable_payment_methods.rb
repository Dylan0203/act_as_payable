class CreateActAsSubscriptablePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :act_as_subscriptable_payment_methods do |t|
      t.references :payment_gateway
      t.string :name
      t.text :description
      t.integer :payment_type
      t.boolean :enabled, default: false

      t.timestamps
    end

    add_foreign_key :act_as_subscriptable_payment_methods, :act_as_subscriptable_payment_gateways, column: :payment_gateway_id
  end
end
