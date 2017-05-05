module SessionHelpers

  def sign_up
    visit "/users/new"
    expect(page.status_code).to eq 200
    fill_in :email, with: "cat@catmail.com"
    fill_in :password, with: "1234"
    fill_in :password_confirmation, with: "1234"
    click_button "Sign up"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end