module SessionHelpers

  def sign_up(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def new_peep
    sign_up(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in(email: 'test@test.com', password: 'password')

    visit '/peeps/new'
    fill_in :message, with: 'Hello, welcome to my peep posts'
    click_button 'Add Peep'
  end
end
