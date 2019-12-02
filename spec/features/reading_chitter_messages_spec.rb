feature 'check the home page is working' do
  scenario 'go to the home page and check it works' do
    visit '/'
    expect(page).to have_content "Chitter Challenge!"
  end
end

feature 'reading chitter messages' do
scenario 'go to the chitter page and read the chitter messages' do
  visit '/chitter'
  expect(page).to have_content "Test Chitter Message"
end
end

feature 'it returns all chitters' do
  scenario 'it should return all the chitter peeps' do
    visit '/chitter'
    expect(page).to include("Test Chitter Message")
    expect(page).to include("Another test chitter")
    expect(page).to include("yet another test chitter")
  end
end
