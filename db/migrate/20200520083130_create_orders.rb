class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.date :date
      t.datetime :delivered_at
      t.float :total
    end
  end
end
