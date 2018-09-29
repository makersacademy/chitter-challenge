require './app'

describe Chitter do

  feature 'View Cheets' do
    scenario 'View existing Cheets' do
      visit('/')

      expect(page).to have_content('Test Cheet One')
      expect(page).to have_content('Test Cheet Two')
      expect(page).to have_content('Test Cheet Three')
    end
  end
end
