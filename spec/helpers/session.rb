module SessionHelpers

  def sign_in(email:, password:)
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(name: 'John',
              username:'j.smith',
              email: 'john@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
