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

    before (:each) do
        User.create(:email => "hello@hello.com",
                    :password => "qwerty",
                    :username => "hellokitty")
      end

    scenario "user can browse all the cheets when opening the home page" do
      visit '/'
      sign_in("hello@hello.com", "qwerty")
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

    # I had trouble understanding how to make the cheets appear chronologically
    # with Capybara i.e test that the cheet posted on 27-02-2015 should appear
    # before the one posted on 28-02-2015.
    # Also I had trouble finding how to extract only the created_at dates to
    # sort out the cheets by date. The Cheet.all fields:[:created_at] works in IRB
    # but doesn't work here (at least it gives me an array of data on IRB but here, nothing)


  end