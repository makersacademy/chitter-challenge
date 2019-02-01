require_relative './web_helpers'

feature 'Chitter App:' do
  feature 'Chitter home' do
    scenario 'should load home page' do
      visit '/'
      expect(page).to have_content "Welcome to Chitter"
    end
  end

  feature 'Feed' do
    scenario 'should load list of peeps' do
      populate_test_data
      visit '/'
      click_on 'View Feed'
      expect(page).to have_content "Test peep"
    end

    scenario 'list should show date' do
      date = Date.today.to_s
      populate_test_data
      visit '/feed'
      expect(page).to have_content date

    end
  end

  feature 'Post peep' do
    scenario 'should allow new post' do
      visit '/feed'
      click_on 'New Peep'
      expect(page).to have_content "Peep away"
    end

    scenario 'should show new post in main feed' do
      visit '/feed/new_peep'
      fill_in 'new_peep', with:'I love peeping'
      click_on 'Peep'
      expect(page).to have_content "I love peeping"
    end
  end
end
