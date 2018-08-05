feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    insert_test_peeps 
    signup_test_user
    click_button('Sign-up')
    expect(page).to have_content "Welcome, whatawally"
  end
end
