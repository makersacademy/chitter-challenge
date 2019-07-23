feature 'first page' do
  scenario 'welcome a user to chitter' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
    click_button('Start')
  end
end
