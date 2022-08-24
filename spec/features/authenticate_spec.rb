feature 'authentication' do
  scenario 'user can sign in' do
    # create a user
    User.create(username: "Godzilla", email: "godzilla@email.com", password: "4321")

    # sign in as this user
    visit '/'
    click_on 'Log-In'
    fill_in(:email, with: "godzilla@email.com")
    fill_in(:password, with: "4321")
    click_on('log-in')

    expect(page).to have_content 'Welcome, Godzilla!'
  end

end