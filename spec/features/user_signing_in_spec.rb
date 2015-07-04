feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    visit '/users/new'

    sign_up_with 'me@example.com', 'password'

    expect(page).to have_content 'Welcome, me@example.com'
  end
end
