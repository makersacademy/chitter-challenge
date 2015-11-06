feature "Users can sign up for Chitter" do
  scenario "When registering my details" do
    visit('/sign_up')
    fill_in('name', with: 'Alaan')
    fill_in('username', with: 'Alaanzr')
    fill_in('email', with: 'Alaanzr@gmail.com')
    fill_in('password', with: 'password')
    expect(page).to have_content 'Welcome Alaan!'
  end
 end
