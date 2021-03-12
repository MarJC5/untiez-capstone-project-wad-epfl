class AddTitleToLegal < ActiveRecord::Migration[6.0]
  def change
    add_column :legals, :title, :string
  end
end
