feature 'sign up' do
  scenario 'signup form up for new user' do
    visit('/')
    click_link('signup')
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end
end
