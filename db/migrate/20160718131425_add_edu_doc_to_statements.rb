class AddEduDocToStatements < ActiveRecord::Migration[5.0]
  def change
    add_column :statements, :edu_doc, :string
  end
end
