class CreateWorkingStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :working_statuses do |t|
      t.string :name
      t.string :content
      t.index :name

      t.timestamps
    end
  end
end
