module SessionHelpers
  def sign_up(name: 'marsupilami',
              username: 'marsu',
              email: 'marsupilami@marsu.com',
              password: 'qwerty',
              password_confirmation: 'qwerty')
    visit '/signup'
    expect(page.status_code).to eq(200)
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/login'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end
end
