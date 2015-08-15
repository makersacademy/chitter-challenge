module SessionHelpers
  def sign_in(email, password)
    visit "/"
    click_link "Get back to Peeping"
    expect(current_path).to eq "/sessions/new"
    fill_in "email", with: email
    fill_in "password", with: password
    click_button "Sign in"
  end
  def sign_up(user)
    visit "/"
    click_link "Become a Chitter Peeper"
    expect(current_path).to eq "/users/new"
    fill_in "name", with: user.name
    fill_in "email", with: user.email
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    fill_in "password_confirmation", with: user.password_confirmation
    click_button "Sign up"
  end
  def post_peep(peep)
    visit "/"
    fill_in "peep", with: peep.content
    click_button "Pop that peeper"
  end
  def name_finder(user_id)
    User.get(user_id).name
  end
  def username_finder(user_id)
    User.get(user_id).username
  end
end