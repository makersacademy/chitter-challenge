feature 'User Sign In' do
  scenario 'Welcomes registered user upon log in' do
    visit '/'
    fill_in(:email, with: 'btrain012@gmail.com')
    fill_in(:password, with: 'btrain')
    click_button("Sign In")
    # expect(page).to have_content('Welcome back James Borrell')
    expect(page).to have_content('Signed in as: BTrain012')
  end
  xscenario 'User is able to post new chits if signed in' do
    visit '/'
    fill_in(:email, with: 'btrain012@gmail.com')
    fill_in(:password, with: 'btrain')
    click_button("Sign In")
    expect(page).to have_content('New Post')
  end
end
