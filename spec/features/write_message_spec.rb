require 'create_new_peep_helper'

feature "User can write a Peep" do

  scenario "User can write a message (check create_new_peep helper)" do
    create_new_peep("message")
  end

  scenario "Message is saved and displays on feed" do
    create_new_peep("message content")
    expect(page).to have_content "Author Name"
    expect(page).to have_content "username"
    expect(page).to have_content "message content"
    expect(page).to_not have_content "error"
  end
end
