require 'spec_helper'

feature 'user login' do
  let(:user) {User.create(name: "Sara",
     handle: "sarsar", email: "sar@sara.com",
    password: "cheese", password_confirmation: "cheese")
}

  scenario 'user visits homepage and logs in' do
    user #keep users in db ?
    log_in("sar@sara.com", "cheese")
    expect(page).to have_content 'Welcome Sara!'
  end

  scenario 'user logs in with unfound details and gets flash error' do
    user
    log_in("sam@sammy.com", "cherios")
    expect(page).to have_content 'Email or password not found'
  end

end
