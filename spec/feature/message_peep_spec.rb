feature "Send a Peep" do
  scenario "I want to be able to post a peep" do
    visit '/messages'
    fill_in :peep, with: "I love to peep"
    click_button "Peep"
    expect(page).to have_content "I love to peep"
    end
  end
