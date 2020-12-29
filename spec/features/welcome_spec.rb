feature 'welcome page' do
  scenario 'sees welcome messages when visiting homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
