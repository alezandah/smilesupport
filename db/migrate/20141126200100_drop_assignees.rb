class DropAssignees < ActiveRecord::Migration
  def up
    drop_table :assignees
  end

  def down
    create_table :assignees  do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.timestamps
    end
  end

end

