require_relative '../../app.rb'

feature 'Able to post a peep' do
  scenario 'A user can post a peep' do
    visit('/')
    fill_in 'tweet', with: 'This is a rumour'
    click_button 'Post'
    expect(page).to have_content('This is a rumour')
  end
end
