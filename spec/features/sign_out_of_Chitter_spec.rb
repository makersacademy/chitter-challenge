feature 'User signs out' do
  background(:each) do
    User.create(name: 'Ezzy Elliott',
            username: 'ezzye',
            email: 'ezzy.elliott@gamil.com',
            password: '123456',
            password_confirmation: '123456'
            )
  end

  scenario 'while being signed in' do
    sign_in(username: 'ezzye',
            password: '123456')
    click_button('Sign out')
    expect(page).to have_content('goodbye')
    expect(page).not_to have_content('Welcome, ezzye')
  end
end