feature 'Signing out' do

  let(:user) { double :user, password: 'secret123', username: 'test_name' }

  skip 'after logging in a user can sign out' do
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    expect(page).to have_selector 'form#sign_out'
  end

end
