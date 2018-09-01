feature "User can write a Peep" do
  scenario "User can write a message" do
    visit("/")
    click_link "write_message"
    fill_in "name", with: "Oliver Sacks"
    fill_in "handle", with: "hat_man"
    fill_in "message", with: "If a man has lost a leg or an eye, he knows he has lost a leg or an eye"
  end
end
