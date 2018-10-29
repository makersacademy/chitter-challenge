module WebHelper

  def create_account
    visit '/'
    fill_in "name", with: "Caitlin"
    fill_in "username", with: "Caitlincooling"
    fill_in "email", with: "caitlin@test.com"
    fill_in "password", with: "caitlin123"
    click_button "Sign up"
  end

  def post_peep
    fill_in 'peep', with: "Hi there"
    click_button "Peep"
  end

  def login
    visit '/'
    click_button "Log in"
    fill_in "email", with: 'caitlin@test.com'
    fill_in "password", with: 'caitlin123'
    click_button "Log in"
  end

end
