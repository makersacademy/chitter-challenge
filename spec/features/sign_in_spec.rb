feature 'Signing in' do

  let(:user) { double :user, password: 'secret123', username: 'test_name' }

  scenario 'exisitng user can give their username and password' do
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'test_name, your Peeps'
  end

end
