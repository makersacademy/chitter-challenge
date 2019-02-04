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

    scenario 'list should show date/time' do
      time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
      populate_test_data
      visit '/feed'
      expect(page).to have_content time
    end

    scenario 'list should be reverse chronological' do
      populate_test_data
      visit '/feed'
      expect('Peeping about snow').to appear_before('Test peep')
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

  feature 'Login' do

    scenario 'should allow new login from home page' do
      login
      expect(page).to have_content "Belinda"
    end

    scenario 'should default to Anon user' do
      populate_test_data
      visit '/feed'
      expect(page).to have_content "Anonymous"
    end
  end

  feature 'Logout' do
    scenario 'should allow user to log out' do
      populate_test_data
      login
      click_on 'Log out'
      expect(page).to have_content 'Anonymous'
    end
    # 
    # scenario 'should allow user to log out when no peeps exist' do
    #   login
    #   click_on 'Log out'
    #   expect(page).to have_content 'Anonymous'
    # end
  end
end
