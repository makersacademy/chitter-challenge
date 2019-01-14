RSpec.feature 'User Authentication' do
  let(:email){'bea@bea.com'}
  let(:password) { 'hello123' }
  let (:name) { 'Beatrice'}
  let (:username) { 'beacourage'}

  context 'Sign Up' do
    scenario 'A user can signup' do
      visit '/'
      click_on 'Sign up'
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Sign up'
      expect(page.current_path).to eql '/profile'
    end
  end


end
