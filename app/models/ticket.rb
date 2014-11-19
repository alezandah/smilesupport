class Ticket < ActiveRecord::Base
  validates :title, :description, presence: true

  belongs_to :assignee

  STATUS = ["Pending", "Assigned"]
  PRIORITY = ["Critical", "Normal", "Low"]
end
