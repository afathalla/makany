class Person < ActiveRecord::Base
acts_as_authentic
belongs_to :location
has_and_belongs_to_many :places
has_attached_file :photo #,:styles => {:small=>'150x150>'}
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  def full_name
    "#{first_name} #{last_name}"
    
  end
end
