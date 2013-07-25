class Involvement < ActiveRecord::Base
  belongs_to :person
  belongs_to :movie
  attr_accessible :role, :person_id, :movie_id
  validates :person_id, presence: :true
  validates :movie_id, presence: :true
end
