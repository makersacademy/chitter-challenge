module SessionHelpers

  def sign_up(name: 'Alice Smith',
              username: 'alice123',
              email: 'alice@example.com',
              password: '12345678',
              password_confirmation: '12345678')
   visit '/users/new'
   fill_in :name, with: name
   fill_in :username, with: username
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
  end

  def log_in(email: 'alice@example.com', password: 'alice123')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log-in'
  end

  def post_peep(peep_text: '')
    visit '/peeps/new'
    fill_in('peep_text', with: peep_text)
    click_button('Post')
  end
end
