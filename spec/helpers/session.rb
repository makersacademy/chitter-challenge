module SessionHelpers

  def sign_up(email:'alice@example.com', name:'Alice',
              username:'Wonderland', password:'orange',
              password_confirmation:'orange')
    visit '/users/new'
    fill_in :email,    with: email
    fill_in :name,  with: name
    fill_in :username,  with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def create_user_alice
    User.create(email: 'alice@example.com', name: 'Alice',
                username: 'Wonderland',password: 'orange',
                password_confirmation: 'orange')
  end

  def log_in(email:'alice@example.com', password:'orange')
    visit '/sessions/new'
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

  def post(content:)
    fill_in :content, with: content
    click_button 'peep'
  end

end