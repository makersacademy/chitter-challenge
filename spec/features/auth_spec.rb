feature 'authentication' do
  it 'a user can sign into the Chitter app' do
    User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')

    visit '/sessions/login'
    fill_in(:username, with: '@pusheen')
    fill_in(:password, with: 'pusheen-password')
    click_button('Log in!')

    expect(page).to have_content 'Welcome, @pusheen'
  end
end