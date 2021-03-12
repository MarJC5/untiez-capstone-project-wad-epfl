class AddDepartureToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :departure, :string
  end
end
