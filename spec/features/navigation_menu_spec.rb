feature 'Feature: navigating by menu bar' do
  context 'at any time' do
    before(:each) { visit('/peeps') }

    scenario 'user goes home' do
      visit('/peeps')
      within 'nav.topnav' do
        click_button('Home')
      end
      expect(page.current_path).to eq '/peeps'
    end
  end

  context 'when logged in' do
    before(:each) { sign_up }

    scenario 'user logs out' do
      within 'nav.topnav' do 
        click_button('Logout')
      end
      expect(page).to have_button 'Login'
    end

    scenario 'user tries to peep' do
      within 'nav.topnav' do
        click_button('Peep')
      end
      expect(page.current_path).to eq '/peeps/new'
    end

    scenario 'user cannot log in or sign up' do
      expect(page).not_to have_button 'Login'
      expect(page).not_to have_button 'Signup'
    end
  end

  context 'when logged out' do
    before(:each) { visit('/peeps') }

    scenario 'user logs in' do
      click_button('Login')
      expect(page.current_path).to eq '/sessions/new'
    end

    scenario 'user signs up' do
      click_button('Signup')
      expect(page.current_path).to eq '/users/new'
    end

    scenario 'user cannot log out or peep' do
      expect(page).not_to have_button 'Logout'
      expect(page).not_to have_button 'Peep'
    end
  end
end
