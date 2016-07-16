class CreateStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :statements do |t|
      t.string :status
      t.string :specialty
      t.string :educational_program
      t.string :study_mode
      t.string :basis
      t.integer :points
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
