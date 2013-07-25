class Involvement < ActiveRecord::Base
  belongs_to :person
  belongs_to :movie
  attr_accessible :role
end
