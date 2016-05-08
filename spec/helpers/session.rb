module SessionHelpers

  def sign_up(name: 'Chris',
              username: 'chrischit',
              email: 'chris@mail.com',
              password: 'password',
              password_confirmation: 'password')
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

  def sign_out
    click_button 'Sign out'
  end

  def create_peep(message: "My first peep")
    visit '/peeps/new'
    fill_in :message,   with: message
    click_button 'Peep!'
  end
end