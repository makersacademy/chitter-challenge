module UserHelpers
  def sign_up(name: 'George', email: 'george@curious.com', username: '@george',
              password: 'yellow_hat', password_confirmation: 'yellow_hat')
    visit('users/new')
    fill_in 'name',                   with: name
    fill_in 'email',                  with: email
    fill_in 'username',               with: username
    fill_in 'password',               with: password
    fill_in 'password_confirmation',  with: password_confirmation
    click_button 'Sign Up'
  end

  def create_users
    User.create(
      name: 'George', email: 'george@curious.com', username: '@george',
      password: 'yellow_hat', password_confirmation: 'yellow_hat')
    User.create(
      name: 'Scooby', email: 'scooby@mystery.com', username: '@scooby',
      password: 'snacks', password_confirmation: 'snacks')
    User.all
  end
end
