module SessionHelpers

  def sign_up(name: 'Zoe Hopkins',
              username: 'diaryofdiscoveries',
              email: 'zoe@example.com',
              password: 'orange!',
              password_confirmation: 'orange!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: name
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
