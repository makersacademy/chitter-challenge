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
    fill_in("peep_body", with: "Second!")
    click_button "Submit"
    click_button "Post new Peep"
    fill_in("peep_body", with: "Seco- oh, never mind :(")
    click_button "Submit"
    expect(page).to have_content("Seco- oh, never mind :( Second!")
  end
end
