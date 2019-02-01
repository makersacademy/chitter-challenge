require 'web_helper'

feature "Visit homepage" do
  scenario "See a welcome title" do
    visit('/')
    expect(page).to have_content("Welcome!")
  end
end

feature "Submit a message" do

  before(:each) do
    @submit_message = WebHelper.submit_message
  end

  scenario "A user can write a message and submit it, then view the message" do
    @submit_message

    expect(page).to have_content("This is a message!")
  end

end
