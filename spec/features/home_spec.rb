RSpec.feature 'Homepage' do
  context 'Signup' do
    scenario 'User can signup for a profile' do
      visit '/'
      click_on 'Sign Up'
      expect(page.current_path).to eq '/signup'
      fill_in 'email', with: 'test@test.com'
      fill_in 'password', with: 'password'
      fill_in 'name', with: 'Joe Bloggs'
      fill_in 'username', with: 'JoeyB'
      click_button 'Sign Up'
      expect(page.current_path).to eq '/profile/1'
    end
  end

  context 'Sign in' do
    let!(:user) {User.create(email: "test@test.com", password: "password123", name: "Joe Bloggs", username: "JoeyB")}
    scenario 'User can sign in and visit their profile' do
      visit '/'
      fill_in 'username', with: 'JoeyB'
      fill_in 'password', with: 'password123'
      click_button 'Sign In'
      expect(page.current_path).to eq '/profile/2'
    end
  end
end