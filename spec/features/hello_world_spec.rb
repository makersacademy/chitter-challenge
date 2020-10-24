feature "Homepage has text on it" do
  scenario "That says Hello World" do
  visit('/')
  expect(page).to have_content("Hello World")
  end
end 