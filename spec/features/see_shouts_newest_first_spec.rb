feature 'Feature: See shouts in reverse chronological order' do
  scenario 'User sees all shouts on the front page, newest first' do
    visit '/'
    click_button 'LOG IN'
    fill_in 'username', with: 'Solo'
    fill_in 'password', with: 'C4rb0n1te'
    click_button 'LOG IN'
    fill_in 'shout_box', with: 'THIS IS MY FIRST SHOUT'
    click_button 'SHOUT'
    fill_in 'shout_box', with: 'THIS IS MY SECOND SHOUT'
    click_button 'SHOUT'
    expect(page).to have_content("@Solo")
    expect(page).to have_content("THIS IS MY SECOND SHOUT")
    expect(page).to have_content("THIS IS MY FIRST SHOUT")
  end
end
