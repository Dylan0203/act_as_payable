class CreateActAsSubscriptableSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :act_as_subscriptable_subscriptions do |t|
      t.references :subscriptable, polymorphic: true
      t.references :subscriber, polymorphic: true
      t.string :title
      t.text :description
      t.integer :period_type, default: 3
      t.integer :period_point, default: 1
      t.monetize :amount, default: 0
      t.integer :grace_period_in_days, default: 0

      t.timestamps
    end
  end
end
