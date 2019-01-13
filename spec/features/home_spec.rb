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

  context 'double signups' do
    let!(:user) { User.create(email: "test2@test.com", password: "password123", name: "Joe Bloggs", username: "1username") }
    scenario 'user cannot sign up with the same username twice' do
      visit '/'
      click_on 'Sign Up'
      expect(page.current_path).to eq '/signup'
      fill_in 'email', with: 'testing@test.com'
      fill_in 'password', with: 'password'
      fill_in 'name', with: 'Joe Bloggs'
      fill_in 'username', with: '1username'
      click_button 'Sign Up'
      expect(page.current_path).to eq '/'
    end

    scenario 'user cannot sign up with the same email twice' do
      visit '/'
      click_on 'Sign Up'
      expect(page.current_path).to eq '/signup'
      fill_in 'email', with: 'test2@test.com'
      fill_in 'password', with: 'password'
      fill_in 'name', with: 'Joe Bloggs'
      fill_in 'username', with: '2username'
      click_button 'Sign Up'
      expect(page.current_path).to eq '/'
    end

  end

  context 'Sign in' do
    let!(:user) { User.create(email: "test@test.com", password: "password123", name: "Joe Bloggs", username: "JoeyB") }
    scenario 'User can sign in and visit their profile' do
      visit '/'
      fill_in 'username', with: 'JoeyB'
      fill_in 'password', with: 'password123'
      click_button 'Sign In'
      expect(page.current_path).to eq '/profile/4'
    end

    scenario 'Displays peeps on the homepage' do
      visit '/'
      fill_in 'username', with: 'JoeyB'
      fill_in 'password', with: 'password123'
      click_button 'Sign In'
      fill_in 'content', with: 'I am a peep'
      click_button 'Post'
      visit '/'
      expect(page).to have_content 'I am a peep'
    end
  
  end
end
