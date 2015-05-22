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

end