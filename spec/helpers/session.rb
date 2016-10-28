module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(email: 'alice@example.com',
    name: 'Alice',
    password: '12345678',
    password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :name, with: name
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_up_and_create_peep(text)
    sign_up
    fill_in :peep_text, with: text
    click_button 'Peep'
  end

  def peep(text)
    fill_in :peep_text, with: text
    click_button 'Peep'
  end

end
