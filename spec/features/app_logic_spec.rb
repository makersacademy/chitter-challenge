feature 'General logic of the application' do
  context 'when logging in' do
    scenario 'can choose to sign up instead' do
      visit ('/')
      expect(page).to have_content 'If you are not registered to Chitter yet, you should sign up!'
      click_button 'sign up'
      expect(current_path).to eq '/signup'
    end
  end
  context 'when logged out from peeps page' do

    before do
      User.create(
        name:                   'Test User Name',
        email:                  'test@test.com',
        password:               'qwerty',
        password_confirmation:  'qwerty')
    end
    
    scenario 'can log in back again' do
      log_in_existing_user
      click_button 'log out'
      click_button 'log in'
      expect(current_path).to eq '/'
    end
  end
end
