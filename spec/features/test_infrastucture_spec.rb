feature 'Testing infrastructure' do
  scenario 'Can run web-app and check page content' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
