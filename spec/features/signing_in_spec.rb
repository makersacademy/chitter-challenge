feature 'user sign in' do
  scenario 'a user can sign in with email and password' do
    User.create(name: 'Bob', email: 'bob@gmail.com', password: 'password', password_confirmation: 'password')
    visit '/sessions/new'
    fill_in "email", with: "bob@gmail.com"
    fill_in "password", with: "password"
    expect{ click_button "Sign In"}.not_to change(User, :count)
    expect(page).to have_content "Welcome, Bob"
  end
end
