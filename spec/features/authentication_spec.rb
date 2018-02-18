feature 'authentication' do
  scenario 'a user is able to sign in successfully' do
    User.create(email: 'telgi@gmail.com', password: 'password2')
    visit '/sessions/new'
    fill_in :email, with: 'telgi@gmail.com'
    fill_in :password, with: 'password2'
    click_button "Sign In"

    expect(page).to have_content 'Hello, telgi@gmail.com'
  end
end
