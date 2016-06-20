module SessionHelpers

  def sign_up
    visit('/')
    expect(page.status_code).to eq 200
    fill_in(:email, with: "test@test.com")
    fill_in(:password, with: "password1")
    fill_in(:name, with: "Dave")
    fill_in(:user_name, with: "Dave")
    click_button("Sign Up")
  end

  def sign_in(user_name:, password:)
    visit '/'
    click_link 'Sign in'
    expect(page.status_code).to eq 200
    fill_in :user_name, with: user_name
    fill_in :password, with: password
    click_button 'Sign In'
    expect(page).to have_content("Here are your cheeps: ")
  end

end
