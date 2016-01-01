# As a maker
# In order to start a conversation as a maker
# I want to reply to a peep from another maker.
feature 'Reply to a message' do
  before do
    sign_up
    log_in
    post_message
    log_out
    sign_up_2
    log_in_2
  end

  scenario 'displays a reply button' do
    expect(page).to have_link 'Reply'
  end

  xscenario 'reply is displayed' do
    click_link 'Reply'
    fill_in(:message, with: 'Oh hey there!')
    click_button 'Peep'
    expect(page).to have_content '@makermakerson Oh hey there!'
  end
end
