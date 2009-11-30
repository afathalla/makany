class Place < ActiveRecord::Base
  acts_as_mappable #Enable Geo features on Place Model
  belongs_to  :location
  belongs_to :city
  has_and_belongs_to_many :people
end
