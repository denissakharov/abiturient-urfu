class CreateJoinTableUserStatement < ActiveRecord::Migration[5.0]
  def change
    change_table :statements do |t|
      t.remove :user_id
      t.string :name
      t.integer :number
      t.index :name
      t.index :number
    end

    drop_table :users
  end
end
