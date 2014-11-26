class RenameRecipientCompany < ActiveRecord::Migration
  def change
    rename_column :tickets, :recipient_company, :recipient_email
  end
end
