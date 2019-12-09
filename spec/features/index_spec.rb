feature "index" do
  scenario "page displays 'Welcome to Chitter!'" do
    visit '/'
    expect(page).to have_content("Welcome to Chitter")
  end

  scenario "when you press the 'news' button the page displays 'Current Events!'" do
    visit '/'
    click_on "take me to the news"
    expect(page).to have_content("Current Events!")
  end
end
