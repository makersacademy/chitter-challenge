feature "posting" do 

  scenario "making a post" do
    visit "/"
    fill_in "text", with: "writing a peep"
    click_button "Peep!"
    expect(page).to have_content "writing a peep"
  end






end
