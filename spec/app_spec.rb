require './app'

describe Chitter do
  feature 'Test' do
    scenario "stores a list of test cheets" do
      visit('/')

      expect(page).to have_content('Test Cheet One')
      expect(page).to have_content('Test Cheet Two')
      expect(page).to have_content('Test Cheet Three')
    end
  end

  feature 'Send Cheet' do
    scenario 'User can post their own Cheets using a form' do
      visit('/')
      fill_in 'peep', with: 'User cheet'
      click_button('Peep!')

      expect(page).to have_content('User cheet')
    end
  end
end
