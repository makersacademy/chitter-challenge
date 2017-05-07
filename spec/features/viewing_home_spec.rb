feature "home page" do

  scenario "finds content on the home page" do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
