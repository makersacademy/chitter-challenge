module SessionHelpers

  def sign_up
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: 'bkluczynski@gmail.com'
    fill_in :name, with: 'Bart'
    fill_in :username, with: 'bartklu'
    fill_in :password, with: 'cool'
    click_button 'Sign up'
  end

  def log_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: 'bkluczynski@gmail.com'
    fill_in :password, with: 'cool'
    click_button 'Log in'
  end


end
