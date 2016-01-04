feature 'log out' do
  let(:user) do
    User.create(email: 'joe_bloggs@gmail.com',
               password: 'yo12345',
               password_confirmation: 'yo12345')
  end

  scenario 'allows user to log out' do
    sign_in(email: user.email,   password: user.password)
    click_button('Sign Out')
    expect(page).to have_content('Goodbye')
  end
end
