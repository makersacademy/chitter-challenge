module SessionHelpers

  def sign_up(username: "tansaku",
            name: "Samuel Russell Hampden Joseph",
            email: "sam@makersacademy.com",
            password: "s3cr3t",
            password_confirmation: "s3cr3t")
    visit "/users/new"
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Submit"
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Submit'
  end

  def post_peep
    sign_up
  end

end
