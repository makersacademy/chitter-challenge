module SessionHelpers

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :password, with: password
    fill_in :username, with: username
    click_button 'Sign in'
  end

  def sign_up(email: 'cat@cat.com',
              name: 'saucy cat',
              username: 'cat',
              password: 'cat',
              password_confirmation: 'cat')
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
