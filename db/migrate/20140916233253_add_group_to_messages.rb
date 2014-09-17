class AddGroupToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :group_id, :integer
    add_index :messages, :group_id
  end
end
