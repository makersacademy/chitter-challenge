# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'all peeps can be seen in reverse chronological order' do

  scenario 'all peeps can be seen' do
    message = 'I am a first peep!'
    message_2 = 'I am a second peep!'
    visit '/'
    fill_in 'peep', with: message
    click_button 'Submit'
    fill_in 'peep', with: message_2
    click_button 'Submit'
    expect(page).to have_content message
    expect(page).to have_content message_2
  end

  scenario 'all peeps are in reverse chronological order' do
    message = 'I am a first peep!'
    message_2 = 'I am a second peep!'
    visit '/'
    fill_in 'peep', with: message
    click_button 'Submit'
    fill_in 'peep', with: message_2
    click_button 'Submit'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: message_2)
    expect(page).to have_selector("ul#peeps li:nth-child(2)", text: message)
  end


end
