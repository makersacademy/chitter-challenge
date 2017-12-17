feature "Viewing Chitter registration form" do
  scenario "I can see the Chitter registration form on the webpage" do
    visit("/users/new")
    expect(page).to have_selector("input")
  end
end
