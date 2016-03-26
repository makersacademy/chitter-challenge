module SessionHelpers
  def sign_up(name: "Luke",
              username: "skywalker",
              email: "luke@starwars.com",
              password: "j3di_temple",
              password_confirmation: "j3di_temple")
    visit "/users/new"
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign up"
  end

  def sign_in(email: "luke@starwars.com", password: "j3di_temple")
    visit "/sessions/new"
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Log in"
  end

  def post(content)
    visit "/peeps/new"
    fill_in :content, with: content
    click_button "Peep!"
  end
end
