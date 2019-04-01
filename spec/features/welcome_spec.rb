feature 'Welcome page' do
  scenario 'user can sign up to chitter' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
    click_button('Sign up')
    expect(page).to have_current_path('/users/sign_up')
    expect(page).to have_content "Please fill in your details:"
  end
end
