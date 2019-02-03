require './app'

RSpec.describe Chitter do
  feature 'Viewing Homepage' do
    scenario 'confirms homepage is working' do
      visit('/')
      expect(page).to have_content('Welcome To Chitter')
      # expect(page).to have_content('This is my first peep')
    end

    scenario 'the user post and view their peep' do
      visit('/')
      fill_in('message', with: 'This is my first peep')
      click_button('Post Peep')
      expect(page).to have_content('This is my first peep')
    end
  end
  
end
