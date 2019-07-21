feature 'welcome page' do
  scenario 'user can visit welcome page' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
