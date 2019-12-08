feature "post a peep" do
  scenario "the user can write a peep and it displays on screen" do
    visit '/chitter'
    fill_in "content", with: "Hello World!"
    click_button "Peep peep"
    expect(page).to have_content "Hello World!"
  end
end
