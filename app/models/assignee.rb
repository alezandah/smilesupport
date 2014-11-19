class Assignee < ActiveRecord::Base
  has_many :tickets
end
