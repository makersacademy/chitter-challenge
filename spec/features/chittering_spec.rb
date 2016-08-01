feature "Chittering" do
  scenario "a authenticated user can post a chitter message" do
    sign_up
    click_button "Post a Peep"
    fill_in :message, with: "Howdy!"
    click_button "Submit Peep"
    expect(page).to have_content "Howdy!"
    expect(page).to have_content "From: Robert"
  end
end
