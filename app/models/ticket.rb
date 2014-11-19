class Ticket < ActiveRecord::Base
  validates :title, :description, presence: true

  STATUS = ["Pending", "Assigned"]
  PRIORITY = ["Critical", "Normal", "Low"]
end
