require 'create_new_peep_helper'

feature "User can write a Peep" do

  scenario "User can write a message (check create_new_peep helper)" do
    visit("/")
    click_link "write_message"
    create_new_peep
  end

  scenario "Message is saved and displays on feed" do
    visit("/write_message")
    create_new_peep
    click_button "Save"
    expect(page).to have_content "hat_man"
    expect(page).to have_content "Oliver Sacks"
    expect(page).to have_content "If a man has lost a leg or an eye, he knows he has lost a leg or an eye"
    expect(page).to_not have_content "error"
  end
end
