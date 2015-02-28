require 'spec_helper'

  feature "User can browse the list of cheets" do

    before(:each){
      Cheet.create(message: "Bonjour",
                   created_at: "2015-02-27",
                   user_id: 1)
    }

    scenario "user can browse all the cheets when opening the home page" do
      visit '/'
      expect(page).to have_content("Bonjour")
    end

  end