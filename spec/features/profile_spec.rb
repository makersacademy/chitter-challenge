RSpec.feature 'profile' do
  context 'When signed in' do
    let!(:user) { User.create(email: "test@test.com", password: "password123", name: "Joe Bloggs", username: "JoeyB") }
    scenario 'Can post a Peep' do
      visit '/'
      fill_in 'username', with: 'JoeyB'
      fill_in 'password', with: 'password123'
      click_button 'Sign In'
      expect(page.current_path).to eq '/profile/6'
      fill_in 'content', with: 'I am a peep'
      click_button 'Post'
      expect(page.current_path).to eq '/profile/6'
      expect(page).to have_content 'I am a peep'
    end

    scenario 'User can log out' do
      visit '/'
      fill_in 'username', with: 'JoeyB'
      fill_in 'password', with: 'password123'
      click_button 'Sign In'
      expect(page.current_path).to eq '/profile/7'
      click_button 'Sign Out'
      expect(page.current_path).to eq '/'
    end
  end
end
