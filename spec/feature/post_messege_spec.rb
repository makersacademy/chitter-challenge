feature "Adding new post" do
  scenario " I want to be able to make a post" do
    visit "/peeps/new"
    fill_in("post", with: "Hello world!")
    click_button "Submit"
    expect(page).to have_text("Hello world!")
  end
end
