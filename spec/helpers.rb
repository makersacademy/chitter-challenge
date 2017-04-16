module Helpers

  def sign_up(name: 'Noora Al Qasimi',
    username: 'Noora-q',
    email: 'noora@example.com',
    password: 'password',
    password_confirmation: 'password')

    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end


  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

  def create_user
    User.create(name: 'Noora Al Qasimi',
      username: 'Noora-q',
      email: 'noora@example.com',
      password: 'password',
      password_confirmation: 'password')
  end

  def create_peep(peep_content)
    visit '/peeps/new'
    fill_in :peep, with: peep_content
    click_button 'Post'
  end
end
