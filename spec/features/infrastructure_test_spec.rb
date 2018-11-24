feature 'Infrastructure Test' do
  scenario 'page has correct content' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
  end
end
