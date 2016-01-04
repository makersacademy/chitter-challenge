module SessionHelpers
  def sign_up(email: 'testemail@example.com',
              username: 'testuser',
              name: 'Test User',
              password: 'password_duh',
              password_confirmation: 'password_duh')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Create Account!'
  end

  def create_test_user
    User.create(email: 'testemail@example.com',
                username: 'testuser',
                name: 'Test User',
                password: 'password_duh',
                password_confirmation: 'password_duh')
  end

  def sign_in(email: 'testemail@example.com', password: 'password_duh')
    create_test_user
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In!'
  end

  def send_peep(peep: 'Oh look I can peep like a pro')
    visit '/peeps/new'
    fill_in :message, with: peep
    click_button 'Peep It!'
  end

  def create_test_peep(peep: 'Oh look I can peep like a pro', user: nil, time: Time.new)
    Peep.create!(message: peep, user: user, time: time)
  end
end
