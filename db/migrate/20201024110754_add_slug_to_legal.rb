class AddSlugToLegal < ActiveRecord::Migration[6.0]
  def change
    add_column :legals, :slug, :string
    add_index :legals, :slug, unique: true
  end
end
