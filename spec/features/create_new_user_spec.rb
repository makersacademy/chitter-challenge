feature 'creating a new user' do
  scenario 'a sign in button exists on the home page' do
    visit '/'
    expect(page).to have_button('Create Account')
  end
end
