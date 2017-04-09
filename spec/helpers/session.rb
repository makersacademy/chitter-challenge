module SessionHelpers

  DEFAULT_NAME      = "Rick Astley"
  DEFAULT_EMAIL     = "rick@astley.com"
  DEFAULT_USERNAME  = "rickroll"
  DEFAULT_PASSWORD  = "nggyu"

  def sign_in(email: DEFAULT_EMAIL,
          password: DEFAULT_PASSWORD)

    visit '/sessions/new'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button 'Sign In'

  end

  def sign_up(email: DEFAULT_EMAIL,
              name: DEFAULT_NAME,
              username: DEFAULT_USERNAME,
              password: DEFAULT_PASSWORD,
              password_confirmation: DEFAULT_PASSWORD)

    visit '/users/new'

    fill_in('email',    with: email)
    fill_in('username', with: username)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    fill_in('name',     with: name)

    click_button 'Sign Up'
  end

  def create_user(email: DEFAULT_EMAIL,
                  name: DEFAULT_NAME,
                  username: DEFAULT_USERNAME,
                  password: DEFAULT_PASSWORD,
                  password_confirmation: DEFAULT_PASSWORD)

    User.create(name: name,
                username: username,
                password: password,
                password_confirmation: password_confirmation,
                email: email)
  end

end
