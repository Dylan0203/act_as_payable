class CreateActAsSubscriptablePaymentGateways < ActiveRecord::Migration[6.1]
  def change
    create_table :act_as_subscriptable_payment_gateways do |t|
      t.string :name
      t.string :gateway_provider
      if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
        t.jsonb :gateway_info, default: {}
      else
        t.json :gateway_info, default: {}
      end

      t.timestamps
    end
  end
end
