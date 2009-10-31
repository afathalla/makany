class Person < ActiveRecord::Base
belongs_to :location
has_and_belongs_to_many :places

  def full_name
    "#{first_name} #{last_name}"
    
  end
end
