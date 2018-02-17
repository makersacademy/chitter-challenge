feature "viewing peeps" do
  scenario "User can see peeps" do
    visit("/")
    expect(page).to have_content("Hello world!")
    expect(page).to have_content("Goodbye!")
  end
end
