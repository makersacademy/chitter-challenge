# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Post message' do

  scenario 'when logged in' do
    sign_up
    log_in
    fill_in(:message, with: 'My first peep')
    click_button 'Peep!'
    expect(page).to have_content('My first peep')
  end

  xscenario 'cannot happen if logged out' do

  end

  xscenario 'displays name and username' do

  end
end
