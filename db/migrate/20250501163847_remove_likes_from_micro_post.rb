class RemoveLikesFromMicroPost < ActiveRecord::Migration[7.2]
  def change
    remove_column :microposts, :likes
  end
end
