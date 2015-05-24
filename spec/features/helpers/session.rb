module SessionHelpers

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

  def sign_up(firstname = "Anna",
              surname = "Klimas",
              username = "ania2ab",
              email = "anna@klimas.com",
              password = "apple",
              password_confirmation = 'apple')
    visit '/users/new'
    fill_in :firstname, :with => firstname
    fill_in :surname, :with => surname
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

  def add_peep(message, user_id)
      find('#peep') do
      fill_in 'user_id', :with => current_user.id
      fill_in 'message', :with => message
      click_button 'Add peep'
    end
  end
end