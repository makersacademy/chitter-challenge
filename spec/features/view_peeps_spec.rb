require_relative './lib/chitter'

feature 'View Peeps' do
  scenario 'user can see what others are saying in reverse chronological order' do
    visit '/'
    click_button 'Go to Peeps!'
    # expect(page).to have_content 'Here are the latest Peeps!'
    # expect(page).to have_content 'Peeps are viewable with the newest at the top:'
    expect(page).to have_content 'this is a test, should be Ginny as user'

  end
end
