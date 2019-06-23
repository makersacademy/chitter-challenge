feature "Welcome window" do
  scenario "user opens a welcome page" do
    visit('/')

    expect(page).to have_content("Welcome to Chitter! Please log in:")

    end
  end
