module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    within("#session") do
      fill_in(:email,    with: email)
      fill_in(:password, with: password)
    end
    click_button('Sign in')
  end

  def sign_up(name:, username:, email:, password:)
    visit '/users/new'
    expect(page.status_code).to eq(200)
      fill_in(:name,    with: name)
      fill_in(:username,    with: username)
      fill_in(:email,    with: email)
      fill_in(:password, with: password)
      click_button('Sign up')
    end

end
