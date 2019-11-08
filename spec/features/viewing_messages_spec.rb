require "capybara/rspec"

feature 'Viewing messages' do
    scenario 'A user can see the messages of others' do
      visit('/chits')
  
      expect(page).to have_content("Hey you! this is Chitter")
      expect(page).to have_content("Have something to Chit?")
      expect(page).to have_content("Chit it now!")
    end
  end