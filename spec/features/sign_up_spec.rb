feature 'Signing up' do

  let(:user) { double :user, email: 'example@example.com', password: 'secret123', name: 'test', username: 'test_name' }

  scenario 'user can sign up' do
    visit '/'
    within 'form#sign_up' do
      fill_in 'username', with: user.username
      fill_in 'name', with: user.name
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome to Chitter test_name'
  end

end
