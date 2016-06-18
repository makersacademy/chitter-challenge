#As a Maker
#So that I can avoid others posting messages on Chitter as me
#I want to log out of Chitter

feature 'Sign out' do

  context 'User signs up then logs out' do
    before(:each) do
      signup
      click_button('Log out')
    end

    scenario 'Redirected to home page' do
      expect(current_path).to eq('/')
    end

    scenario 'Tries to access peeps but is redirected' do
      visit('/peeps')
      expect(current_path).to eq('/user/signin')
    end
    
    scenario 'Tries to access peeps but is redirected with error message' do
      visit('/peeps')
      expect(page).to have_content('Please log in first')
    end

    xscenario 'logout message displayed' do
    end
  end
end
