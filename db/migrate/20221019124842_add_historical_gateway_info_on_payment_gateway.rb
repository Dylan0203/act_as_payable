class AddHistoricalGatewayInfoOnPaymentGateway < ActiveRecord::Migration[6.1]
  def change
    add_column :act_as_subscriptable_payment_gateways, :historical_gateway_info, :jsonb, default: []
  end
end
