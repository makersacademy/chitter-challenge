feature "Chitter home page" do
  scenario "it has content" do
    visit '/'
    expect(page).to have_content "Chitter"
  end
end
