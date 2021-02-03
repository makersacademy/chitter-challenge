feature 'Signing in' do
  scenario 'signing in allows me to use my username' do
    Users.sign_up(username: "charliecodes",
                  firstname: "Charlie",
                  secondname: "Fischer",
                  email: "charlie@makersacademy.com",
                  password: "password")

    visit('/')
    click_button('Sign In')
    fill_in('username', with: 'charliecodes')
    fill_in('password', with: 'password')
    click_button('Sign In')

    expect(page).to have_content('Hello charliecodes,')
  end
end
