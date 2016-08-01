feature 'Sign out' do

  let!(:user) do
    User.create(name: "Jane Smith",
                email: 'user@example.com',
                username: "janesmith",
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_in(username: user.username, password: user.password)
    click_button("Sign out")
    expect(page).to(have_content("Goodbye!"))
      expect(page).not_to(have_content("Welcome #{user.username}"))
  end

end
