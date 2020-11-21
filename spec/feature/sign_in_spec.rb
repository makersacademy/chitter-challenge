feature 'signing in to Chitter' do
  scenario 'a user can sign in' do
    User.create(email: "Craig@David.com", password: "rewind1", name: "Craig David", username: "BoSelecta")

    visit '/sign-in'
    fill_in('username', with: 'BoSelecta')
    fill_in('password', with: 'rewind1')
    click_button('Sign In')

    expect(page).to have_content 'Welcome Back'
  end
end
