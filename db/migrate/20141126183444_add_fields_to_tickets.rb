class AddFieldsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :first_name, :string
    add_column :tickets, :last_name, :string
    add_column :tickets, :department, :string
    add_column :tickets, :email, :string
    add_column :tickets, :recipient_company, :string
  end
end
