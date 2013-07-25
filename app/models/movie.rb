class Movie < ActiveRecord::Base
  validates :title, presence: :true
  attr_accessible :description, :format, :title

  has_many :involvements
  has_many :people, through: :involvements
end
