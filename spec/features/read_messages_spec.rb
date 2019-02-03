# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'all peeps can be seen in reverse chronological order' do

  scenario 'all peeps can be seen' do
    create_user
    valid_login
    post_three_messages
    expect(page).to have_content 'I am a first peep!'
    expect(page).to have_content 'I am a second peep!'
    expect(page).to have_content 'I am a third peep!'
  end

  scenario 'all peeps are in reverse chronological order' do
    create_user
    valid_login
    post_three_messages
    message = 'I am a first peep!'
    message_2 = 'I am a second peep!'
    message_3 = 'I am a third peep!'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: message_3)
    expect(page).to have_selector("ul#peeps li:nth-child(2)", text: message_2)
    expect(page).to have_selector("ul#peeps li:nth-child(3)", text: message)
  end

end
