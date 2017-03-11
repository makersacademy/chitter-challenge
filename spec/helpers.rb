module Helpers

  def sign_up(name: 'Noora Al Qasimi',
    username: 'Noora-q',
    email: 'noora@example.com',
    password: 'paasword',
    password_confirmation: 'password')

    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
