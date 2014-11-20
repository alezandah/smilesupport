class Assignee < ActiveRecord::Base
  has_many :tickets, dependent: :destroy

  def full_name
    name = "#{self.first_name}  #{self.last_name}"
    return name
  end

end
