class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.bigint :user_id
      t.integer :no_of_items
      t.float :total
    end
  end
end
