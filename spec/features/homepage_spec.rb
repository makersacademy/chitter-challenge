feature 'Homepage' do
  scenario "User starts on a homepage" do
    visit '/'

    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_button 'Messages'
    expect(page).to have_button 'Log in'
  end
end