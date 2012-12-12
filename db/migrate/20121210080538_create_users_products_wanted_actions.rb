class CreateUsersProductsWantedActions < ActiveRecord::Migration
  def change
    create_table :users_products_wanted_actions do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :wanted_action_id

      t.timestamps
    end
  end
end
