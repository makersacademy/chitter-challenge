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
end
