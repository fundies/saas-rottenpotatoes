class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :moviegoer
  attr_protected :moviegoer_id # see text
  validates :movie_id, :presence => true
  validates_associated :movie
  validates_inclusion_of :potatoes, :in => [0,1,2,3,4,5]
end

