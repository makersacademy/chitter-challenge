feature "Welcome to Chitter" do

  scenario "it has a welcome page" do
    visit('/')
    expect(page).to have_content "C H I T T E R"

  end

end
