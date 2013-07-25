class Person < ActiveRecord::Base
  validates :first_name, presence: :true
  attr_accessible :bio, :first_name, :last_name
end
