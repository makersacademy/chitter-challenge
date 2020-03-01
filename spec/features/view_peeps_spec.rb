feature 'has a page for posting peeps' do
    scenario '#can enter a peep' do
      visit('/make_a_peep')
      fill_in :new_peep, with: "This is my first peep"
      fill_in :user, with: "Flounder"
      click_button('Submit')
      visit('/view_peeps')
      expect(page).to have_content("Flounder")
      expect(page).to have_content("This is my first peep")
    end
  end