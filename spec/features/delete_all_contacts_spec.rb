require 'rails_helper'

RSpec.feature "DeleteAllContacts", type: :feature do
  scenario "User clicks Delete All Contacts Button" do
      visit "contacts"

    
      click_button "delete_all_contacts"

      expect(page).to have_text("You have removed all results!")
    end


end
