feature "It loads the Page" do
  scenario "will present 'Chitter'" do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
