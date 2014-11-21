class Ticket < ActiveRecord::Base
  validates :title, :description, presence: true

  belongs_to :assignee

  STATUS = ["Pending", "Assigned", "Resolved", "Open"]
  PRIORITY = ["Level 1", "Level 2", "Level 3"]
  PENDING = "Pending"
  ASSIGNED = "Assigned"
  RESOLVED = "Resolved"
  LEVEL_3 = "Level 3"
  LEVEL_1   = "Level 1"
  LEVEL_2 = "Level 2"
  OPEN = "Open"

  def self.pending_count
    count_arr = []
    tickets = Ticket.all
    tickets.each do |ticket|
      if ticket.status == nil || ticket.status == Ticket::PENDING
        count_arr << ticket
      end
    end
    count_arr.count
  end
  def self.pending
    count_arr = []
    tickets = Ticket.all
    tickets.each do |ticket|
      if ticket.status == nil || ticket.status == Ticket::PENDING
        count_arr << ticket
      end
    end
    count_arr
  end
end
