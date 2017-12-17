feature "posting peeps" do
  before do
    sign_up
    sign_in
  end
  scenario "a user should post a peep and have it appear on the page" do
    fill_in "peep", with: "my test peep"
    click_button "Peep!"
    expect(page).to have_content("my test peep")
  end
  
end
