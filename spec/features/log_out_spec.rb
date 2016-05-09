feature 'User log out' do

  before(:each) do
    User.create(name: 'Marley',
                username: 'Luni',
                email: 'marley@cat.com',
                password: 'dreamies',
                password_confirmation: 'dreamies')
  end

    scenario 'While logged in' do
      log_in(username: 'Luni', password: 'dreamies')
      click_button 'Log out'
      expect(page).to have_content('Goodbye, have a beautiful day!')
      expect(page).not_to have_content('Welcome, Luni!')
    end

end
