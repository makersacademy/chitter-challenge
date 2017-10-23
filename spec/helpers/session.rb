
module SessionHelpers

  def sign_up
    visit '/maker/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: 'Tim'
    fill_in :username, with: 'timjones10'
    fill_in :email, with: 'timjones10@hotmail.com'
    fill_in :password, with: 'challenge'
    fill_in :password_confirmation, with: 'challenge'
    click_button 'Sign up'
  end

  def sign_in(name:, username:, email:, password:)
    visit '/sessions/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
