xfeature 'Authentication' do

  scenario 'A user can sign in' do
    visit '/sessions/new'
    fill_in(:email, with: 'example@example.co.uk')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, example@example.co.uk'
  end

end
