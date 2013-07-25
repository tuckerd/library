class Movie < ActiveRecord::Base
  validates :title, presence: :true
  attr_accessible :description, :format, :title
end
