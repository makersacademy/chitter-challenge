feature 'User signs out' do

  before(:each) do
    User.create(full_name: "Fred Bloggs",
                  user_name: "fredb",
                  email: "fred@bloggs.com",
                  password: "ABC123",
                  password_confirmation: "ABC123")
  end

  scenario 'while being signed in' do
    sign_in(user_name: 'fredb', password: 'ABC123')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, fredb')
  end

end
