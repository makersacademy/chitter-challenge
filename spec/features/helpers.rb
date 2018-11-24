  def Sign_in
    visit('/sessions/new')
    fill_in 'email', with: 'sam@example.com'
    fill_in 'password', with: 'password'
    click_button "Sign in"
  end
end
