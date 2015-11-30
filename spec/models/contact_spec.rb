require 'rails_helper'

RSpec.describe Contact, type: :model do

 
    it "allows reading and writing for :first_name" do
      contact = Contact.new
      contact.first_name = 'John'
      expect(contact.first_name).to eq('John')
    end
    
    it "allows reading and writing for :last_name" do
      contact = Contact.new
      contact.last_name = "Doe"
      expect(contact.last_name).to eq("Doe")
    end
    
    it "allows reading and writing for :email" do
      contact = Contact.new
      contact.email = 'johndoe@anonymous.com'
      expect(contact.email).to eq('johndoe@anonymous.com')
    end
    
    it "allows reading for :phone" do
      contact = Contact.new
      contact.phone = '(012) 345-6789'
      expect(contact.phone).to eq('(012) 345-6789')
    end
    

  it "has 0 Contacts at the start" do
    expect(Contact.count).to eq(0)
  end

  it "has 1 Contact after #create" do
    Contact.create(:first_name => 'John', :last_name => 'Doe')
    expect(Contact.count).to eq(1)
  end

  it "has 0 Contacts when using transactions" do
    expect(Contact.count).to eq(0)
  end



end
