feature 'login' do
  it 'a user can log in' do
    User.create(name: 'Ania', username: 'an', email: 'an@email.com', password: 'a1')

    visit '/login'
    fill_in(:email, with: 'an@email.com')
    fill_in(:password, with: 'a1')
    click_button('Log in')

    expect(page).to have_content 'Welcome, Ania'
  end
end
