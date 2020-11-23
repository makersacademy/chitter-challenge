feature 'Sign up' do
  scenario 'As an user, I wan to sign up for chitter' do
    visit '/users/new'
    fill_in 'username', with: 'Username_test'
    fill_in 'email', with: 'signup@test.com'
    fill_in 'password', with: 'testpassword1'
    click_button 'Sign Up'

    expect(page).to have_content "Welcome to Chitter!"
  end
end
