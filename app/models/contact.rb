class Contact < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true


def self.search(query)
  where("first_name like ?", "%#{query}%") 
end

end
