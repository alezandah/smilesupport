class RenameAssigneeId < ActiveRecord::Migration
  def change
    rename_column :tickets, :assignee_id, :user_id
  end
end
