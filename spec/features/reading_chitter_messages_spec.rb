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
