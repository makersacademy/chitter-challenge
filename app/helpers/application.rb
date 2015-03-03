module SessionHelpers

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

  def sign_up(email = "test@test.com", username = "thrillhouse", name = "sean", password = "pray4mojo", password_confirmation = "pray4mojo")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end