module SessionHelpers

  def sign_up
    visit '/sign_up'
    fill_in :name, with: "James"
    fill_in :email, with: "james@email.com"
    fill_in :username, with: "jimbo"
    fill_in :password, with: "llama123"
    click_button :Submit
  end

  def sign_up_with_used_email
    visit '/sign_up'
    fill_in :name, with: "Bob"
    fill_in :email, with: "james@email.com"
    fill_in :username, with: "bobby"
    fill_in :password, with: "potato12"
    click_button :Submit
  end

  def sign_up_with_used_username
    visit '/sign_up'
    fill_in :name, with: "Bob"
    fill_in :email, with: "bob@email.com"
    fill_in :username, with: "jimbo"
    fill_in :password, with: "potato12"
    click_button :Submit
  end

end
