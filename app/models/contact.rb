class Contact < ActiveRecord::Base


  validates :first_name, :presence => true
  validates :last_name, :presence => true


def self.first_name_search(query)
  where("first_name like ?", "%#{query}%") 
end

def self.last_name_search(query)
  where("last_name like ?", "%#{query}%") 
end

end
