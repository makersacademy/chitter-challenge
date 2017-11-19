require './app/app.rb'

feature 'peep' do
  scenario 'posting a peep' do
    visit('/newpeep')
    fill_in('peep', with: 'A cool message to take a lot of likes')
    click_on('Post')
    expect(page).to have_content 'A cool message to take a lot of likes'
  end
end
