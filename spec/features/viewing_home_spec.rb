feature "home page" do

  scenario "finds content on the home page" do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario "clicks home button to return home" do
    visit('/users')
    click_button 'Home'
  expect(page).to have_content 'Welcome to Chitter!'
  end

end
