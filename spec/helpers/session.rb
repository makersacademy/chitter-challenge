module SessionHelpers

  def sign_up(email: 'rosie@allott.com',
              name: 'Ral',
              username: 'Ral',
              password: 'my_password',
              password_confirmation: 'my_password')
    visit '/'
    expect(page).to have_content 'Chitter!'
    click_button 'Sign up'
    expect(current_path).to eq '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_in(email: 'rosie@allott.com',
              password: 'my_password')
    visit '/'
    expect(page).to have_content 'Chitter!'
    click_button 'Sign in'
    expect(current_path).to eq '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Submit'
  end

  def sign_out
    visit '/'
    click_button 'Sign out'
  end
end
