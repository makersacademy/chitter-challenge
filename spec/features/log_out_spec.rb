feature 'User signs out' do

  before(:each) do
    User.create(email: 'bob@example.com',
                password: '123',
                password_confirmation: '123',
                username: 'bobtheman',
                name: 'Bobby Sing')
  end

  scenario 'while being signed in' do
    visit('/log_in')
    fill_in('email', with: "bob@example.com")
    fill_in('password', with: "123")
    click_button("Log In")
    click_button("Log out")
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, bobtheman')
  end

end