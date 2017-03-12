# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature "sign_in" do
  scenario "user can sign in using username and password" do
    User.create(name: 'Natalia', username: 'Nat-Nat',
                e_mail: 'n@mail.com', password: '123456')
    visit '/sign_in'
    fill_in 'username', with: "Nat-Nat"
    fill_in 'password', with: "123456"
    click_button 'Sign in'
    expect(page).to have_content 'Welcome, Natalia!'
  end
end
