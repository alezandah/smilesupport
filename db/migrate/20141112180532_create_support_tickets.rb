class CreateSupportTickets < ActiveRecord::Migration
  def change
    create_table :support_tickets do |t|
      t.string :assignee
      t.string :status
      t.string :priority
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
