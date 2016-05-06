module SessionHelpers
  def sign_up(email, password, pwd_conf)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: pwd_conf
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit 'sessions/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_out(email:, password:)
    sign_in(email: user.email, password: user.password)
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def recover_password
   visit '/users/recover'
   fill_in :email, with: "alice@example.com"
   click_button "Submit"
 end
end