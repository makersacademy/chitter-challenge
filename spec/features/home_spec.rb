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
      expect(page.current_path).to eq '/'
    end
  end
end