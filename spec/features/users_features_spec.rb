feature 'Sign Up' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'luisa')
    fill_in('email', with: 'luisa@email.com')
    fill_in('password', with: '123test')
    click_button('Submit')

    expect(page).to have_content("Welcome, luisa")
  end

  scenario 'a user can sign in' do
    User.create(email: 'luisa@email.com', password: '123test', name: 'luisa')
    visit '/sessions/new'
    fill_in :name, with: 'luisa'
    fill_in :email, with: 'luisa@email.com'
    fill_in :password, with: '123test'
    click_button('Sign in')
    expect(page).to have_content 'Welcome, luisa'
  end
end