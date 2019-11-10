feature "homepage" do
  scenario "when first visiting the site" do
    visit('/')
    expect(page).to have_content 'Hi! Welcome to Chitter'
  end
end
