require 'create_new_peep_helper'

feature "User can write a Peep" do
  scenario "User can write a message (check create_new_peep helper)" do
    create_new_peep
  end

  scenario "Message is saved and displays on feed" do
    create_new_peep
    click_button "Post"
    expect(page).to have_content "If a man has lost a leg or an eye, he knows he has lost a leg or an eye"
  end
end
