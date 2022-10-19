class CreateActAsSubscriptablePaymentGateways < ActiveRecord::Migration[6.1]
  def change
    create_table :act_as_subscriptable_payment_gateways do |t|
      t.string :name
      t.string :gateway_provider
      t.jsonb :gateway_info, default: {}

      t.timestamps
    end
  end
end
