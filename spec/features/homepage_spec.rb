feature 'Homepage' do
  scenario 'Displays the peep channel' do
    visit('/')
    click_button "Guest"
    expect(page).to have_content 'PEEP CHANNEL'
    expect(page).to have_button 'LOGOUT'
    expect(page).to have_button 'NEW PEEP'
    expect(page).to have_content 'My first peep!'
    expect(page).to have_content '@ddregalo'
    expect(page).to have_content '2018-03-17 13:40:22'
    expect(page).to have_content 'The world is flat.'
    expect(page).to have_content '@bhavy'
    expect(page).to have_content '2018-03-17 13:45:44'
    expect(page).to have_button 'NEW PEEP'
    expect(page).to have_button 'LOGOUT'
  end
end
