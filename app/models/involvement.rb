class Involvement < ActiveRecord::Base
  belongs_to :person
  belongs_to :movie
  attr_accessible :role, :person_id, :movie_id
  validates :person, presence: :true
  validates :movie, presence: :true
  validates :role, presence: :true
end
