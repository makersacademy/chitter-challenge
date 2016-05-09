module SessionHelpers

  def sign_up(name: 'Aday Mesa',
              username: 'adaymesa',
              email: 'adaymesagc@gmail.com',
              password: 'yipiyey!',
              password_confirmation: 'yipiyey!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: name
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def create_peep(message = "Am I peeping?")
    visit '/peeps/new'
    fill_in :peep,   with: message
    click_button 'Peep!'
  end
end
