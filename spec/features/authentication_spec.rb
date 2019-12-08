feature 'authentication' do

  scenario "a user can sign in" do
    User.create(
        email: 'samm@makersacademy.com', 
        password: 'password123', 
        name: 'Sam Morgan',
        username: 'sjmog'
      )

    visit '/sessions/new'
    fill_in 'email', with: 'samm@makersacademy.com'
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, sjmog'
  end

end