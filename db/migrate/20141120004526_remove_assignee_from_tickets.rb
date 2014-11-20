class RemoveAssigneeFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :assignee, :string
  end
end
