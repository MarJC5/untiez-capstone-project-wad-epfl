class AddUploadAvatarToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_upload, :string
  end
end
