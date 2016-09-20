# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter


feature 'Signing out of a user account' do

  let(:user) do
    User.create(name: 'luke',
                username: 'luke',
                email: 'luke@luke.com',
                password: 'abc123',
                password_confirmation: 'abc123')
  end

  scenario 'a user can sign out of their session' do
    sign_in(username: user.username, password: user.password)
    click_button 'Sign Out'
    expect(page).to have_content 'Thank you for visiting Chitter. Goodbye'
    expect(page).not_to have_content 'Welcome luke!'
    expect(current_path).to eq '/peeps'
  end
end
