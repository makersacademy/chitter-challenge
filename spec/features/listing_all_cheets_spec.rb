require 'spec_helper'

  feature "User can browse the list of cheets" do

    before(:each){
      Cheet.create(message: "Bonjour",
                   created_at:"2015-02-27",
                   user_id: 1)
      Cheet.create(message: "Au revoir",
                  created_at:"2015-02-28",
                  user_id: 1)
    }

    scenario "user can browse all the cheets when opening the home page" do
      visit '/'
      expect(page).to have_content("Bonjour")
      expect(page).to have_content("Au revoir")
    end

    # scenario "all cheets are sorted out chronogically by post date" do
    #   visit '/'
    #   expect(page).to have_content("Bonjour" && "Au revoir")
    #   sort_cheet
    #   expect(page).to have_content("Bonjour")
    # end

    # def sort_cheet
    #   sorting = []
    #   sorting << Cheet.all fields:[:created_at]
    #   sorting.sort
    # end


  end