# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'I want to register my details to sign in' do
  scenario 'user nazz can enter name, email and password to register' do
    visit('/')
    expect(page).to have_selector("input[value='Sign in']")
    click_button('Sign in')
    expect(current_path).to eq '/users/new'
    expect(page.status_code).to eq 200
  end
end
