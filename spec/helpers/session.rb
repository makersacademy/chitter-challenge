module SessionHelpers

  def sign_up(email: 'ruan@example.com',
              password: 's3cr3t',
              password_confirmation: 's3cr3t',
              name: 'Ruan',
              user_name: 'ruanodendaal')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    click_button 'Sign up'
  end

  def sign_in(email: 'ruan@example.com', password: 's3cr3t')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def single_peep
    sign_up
    sign_in
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Post Peep!'
  end

  def multi_peep
    sign_up
    sign_in
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Post Peep!'
    visit '/peeps/new'
    fill_in 'message', with: 'Hello World'
    click_button 'Post Peep!'
  end

  def recover_password
    visit '/users/recover'
    fill_in :email, with: "ruan@example.com"
    click_button "Submit"
  end

  def set_password(password:, password_confirmation:)
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Submit"
  end

end
