require 'web_helper'

feature "Visit homepage" do
  scenario "See a chitter title" do
    visit('/')
    expect(page).to have_content("Chitter!")
  end
end

feature "Sign-up" do
  before(:each) do
    @sign_up = WebHelper.sign_up
  end

  scenario "A user can sign-up to Chitter" do
    @sign_up

    expect(page).to have_content("Successful sign-up, please go back to the login page by clicking the button below!")
  end

end

feature "Submit a message" do

  before(:each) do
    @submit_message = WebHelper.submit_message
  end

  scenario "A user can write a message and submit it, then view the message" do
    @sign_in

    expect(page).to have_content("This is a message!")
  end

end

feature "See message in all chitters page" do

  before(:each) do
    @view_all_chitters = WebHelper.view_all_chitters
  end

  scenario "User can see their message in the all chitters page" do
    @view_all_chitters

    expect(page).to have_content("This is a message!")
  end

end
