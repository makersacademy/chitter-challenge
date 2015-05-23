module SessionHelpers

  def sign_up(username = 'Big G',
              name = 'Andy Gout',
              email = 'example@test.com',
              password = 'P0tat0M0nkey!',
              password_confirmation = 'P0tat0M0nkey!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign in'
  end

  def add_peep(text)
    within('#new-peep') do
      fill_in 'text', with: text
      click_button 'Peep!'
    end
  end

end