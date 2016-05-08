feature 'new accounts can be set up' do
  scenario 'a create account button exists on the home page' do
    visit '/'
    expect(page).to have_button('join chittr')
  end
  scenario 'clicking the create account button redirects the user' do
    visit '/'
    click_button('join chittr')
    expect(page).to have_content('your account details')
  end
end

feature 'creating a new user' do
  scenario 'a user can create an account' do
    expect {create_an_account}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alice Wonderland')
    expect(User.first.email).to eq('alice@lookingglass.com')
  end
end
