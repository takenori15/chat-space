class AddIndexToGroup < ActiveRecord::Migration[5.0]
  def change
    add_index :groups, :group_name
  end
end
