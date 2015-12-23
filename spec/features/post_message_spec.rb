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

  scenario 'cannot happen if logged out' do
    sign_up
    log_in
    click_button('Log out')
    visit '/peeps'
    fill_in(:message, with: 'This peep shouldn\'t be here')
    click_button 'Peep!'
    expect(page).not_to have_content('This peep shouldn\'t be here')
    expect(page).to have_content('Oops! You need to be logged in to peep.')
  end

  xscenario 'displays name and username' do

  end
end
