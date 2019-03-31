feature 'Welcome page' do
  scenario 'user can sign up to chitter' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
    click_button('Sign up')
    expect(page).to have_current_path('/sign_up')
  end
end
