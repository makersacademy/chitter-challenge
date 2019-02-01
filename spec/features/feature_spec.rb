require_relative './web_helpers'

feature 'Chitter App:' do
  feature 'Chitter home' do
    scenario 'it should load home page' do
      visit '/'
      expect(page).to have_content "Welcome to Chitter"
    end
  end

  feature 'Feed' do
    scenario 'it should load list of peeps' do
      populate_test_data
      visit '/'
      click_on 'View Feed'
      expect(page).to have_content "Test peep"
    end
  end
end
