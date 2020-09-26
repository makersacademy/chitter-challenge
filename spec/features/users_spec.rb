feature 'User sign-up to chitter' do
  scenario 'A user signs up' do
    visit '/'
    click_button("Sign up")
    fill_in(:user_name, with: "prycey77")
    fill_in(:name, with: "Garry Barlow")
    fill_in(:email, with: "testemail@test.com")
    fill_in(:password, with: "abc123")
    click_button("Submit")

  end
end