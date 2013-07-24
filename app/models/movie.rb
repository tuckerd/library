class Movie < ActiveRecord::Base
  attr_accessible :description, :format, :title
end
