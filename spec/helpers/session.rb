module SessionHelpers

  def sign_up(name: 'George Eaton',
    username: 'Gweaton',
    email: 'george@example.com',
    password: 'george123',
    password_confirmation: 'george123')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,                  with: name
    fill_in :username,              with: username
    fill_in :email,                 with: email
    fill_in :password,              with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def log_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Log in'
  end

  def log_in_post_peep
    sign_up
    log_in(username: 'Gweaton', password: 'george123')
    visit '/peeps/new'
    fill_in :message, with: 'My first peep'
    click_button 'Post peep'
  end
end
