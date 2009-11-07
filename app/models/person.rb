class Person < ActiveRecord::Base
acts_as_authentic
belongs_to :location
has_and_belongs_to_many :places

  def full_name
    "#{first_name} #{last_name}"
    
  end
end
