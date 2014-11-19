class CreateAssignees < ActiveRecord::Migration
  def change
    create_table :assignees do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title

      t.timestamps
    end
  end
end
