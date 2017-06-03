feature "Posting messages (peeps)" do
  scenario "User can post a Peep to Chitter" do
    visit "/"
    click_button "Post new Peep"
    fill_in("peep_body", with: "First!")
    click_button "Submit"
    expect(page).to have_content("First!")
  end

  scenario "User posts two messages and sees them in reverse chronological order" do
    visit "/"
    click_button "Post new Peep"
    fill_in("peep_body", with: "First!")
    click_button "Submit"
    click_button "Post new Peep"
    fill_in("peep_body", with: "Fir- oh, never mind :(")
    expect(page).to have_content("Fir- oh, never mind :( First!")
  end
end
