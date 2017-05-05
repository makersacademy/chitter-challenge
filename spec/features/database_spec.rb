feature "Database" do
  scenario "works" do
    visit '/test_db'
  expect(page).to have_content 'Woo!!!'
  end
end
