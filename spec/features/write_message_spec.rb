require 'peep_helpers'

feature "User can write a Peep" do

  scenario "User can write a message (check create_new_peep helper)" do
    create_new_peep_one("message")
  end

  scenario "Message is saved and displays on feed" do
    create_new_peep_one("message content")
    expect(page).to have_content "message content"
    expect(page).to_not have_content "error"
  end

  scenario "Message body can't be blank" do
    sign_up
    visit("/write_message")
    click_button "Save"
    expect(page).to have_content "Body can't be blank"
  end
end
