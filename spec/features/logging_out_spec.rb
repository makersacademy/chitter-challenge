feature "Logging out" do
  let(:user) do
  User.create(full_name: 'Incredible Yev',
              email: 'incredible@yev.com',
              password: 'bla-bla-bla',
              password_confirmation: 'bla-bla-bla')
  end

  scenario "while being logged in" do
    log_in(email: user.email,   
           password: user.password)
    click_button('Log out')
    expect(page).to have_content 'Goodbye, Incredible Yev!'
    expect(page).not_to have_content 'Welcome, Incredible Yev!'
  end
end