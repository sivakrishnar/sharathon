class CreateWantedActions < ActiveRecord::Migration
  def change
    create_table :wanted_actions do |t|
      t.string :wanted_action

      t.timestamps
    end
  end
end
