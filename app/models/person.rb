class Person < ActiveRecord::Base
  validates :first_name, presence: :true
  attr_accessible :bio, :first_name, :last_name

  has_many :involvements
  has_many :movies, through: :involvements

  def name
    "#{first_name} #{last_name}"
  end
end
