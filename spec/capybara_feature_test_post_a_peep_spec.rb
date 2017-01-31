feature "create peeps and see a list of peeps in reverse chronological order" do

    scenario 'create a new link entry' do
      visit '/sign_up'
      fill_in :email, with: "john.franco@franco.com"
      fill_in :name, with: "John Franco"
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
      click_button "Sign out"
      visit '/sessions_new'
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
      expect(current_path).to eq('/peeps')
      click_button "press button to Peep"
      fill_in :peep, with: "Today I am busy building a twitter clone"
      click_button "submit"
    end
    scenario 'user wants to see the list of peeps' do
      visit '/sign_up'
      fill_in :email, with: "john.franco@franco.com"
      fill_in :name, with: "John Franco"
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
      click_button "Sign out"
      visit '/sessions_new'
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
      click_button "press button to Peep"
      fill_in :peep, with: "Today I am busy building a twitter clone"
      click_button "submit"
      expect(current_path).to eq('/peeps')
      expect(page).to have_content("Today I am busy building a twitter clone")
    end

  end
