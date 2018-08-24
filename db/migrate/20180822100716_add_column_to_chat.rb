class AddColumnToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :image, :text
  end
end
