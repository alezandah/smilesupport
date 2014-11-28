class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :company_name, presence: true

  has_many :tickets, dependent: :destroy

  def username
    name = first_name + " " + last_name
  end

end
