feature 'logging in' do

  before do
    User.create(name: 'Ollie', username: 'ollie4carol', email: 'ollie@chitter.com', password: 'password123')
  end

  scenario "logging in " do
    visit('/')
    click_button 'log in'
    fill_in 'email', with: "ollie@chitter.com"
    fill_in 'password', with: "password123"
    click_button 'log in'
    expect(page).to have_content "welcome, Ollie"
  end
end
