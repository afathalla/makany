class Place < ActiveRecord::Base
  belongs_to  :location
  has_and_belongs_to_many :people
end
