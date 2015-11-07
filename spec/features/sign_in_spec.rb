feature 'Sign in' do
  scenario 'signing in' do
    User.create(email: 'andy@andy.com',
                name: 'andy',
                username: 'k0zakinio',
                password: '4ndyDragon')
    visit '/users/sign_in'
    fill_in(:email, with: 'andy@andy.com')
    fill_in(:password, with: '4ndyDragon')
    click_button('Sign in')
    expect(page).to have_content('Welcome, andy')
  end
end