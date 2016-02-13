feature 'User can log out' do
  before(:each) do
    User.create(
      name: "Bob",
      username: "bigbob",
      email: "Bob@email.com",
      password: "123abc",
      password_confirmation: "123abc"     
    )
  end

  scenario 'while signed in' do
    log_in(email: 'Bob@email.com', password: '123abc')
    click_button 'Log out'
    expect(page).to have_content('Farewell') 
    expect(page).not_to have_content('Welcome, bigbob')
  end
end
