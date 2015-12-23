# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Post message' do
  before do
    sign_up
    log_in
  end

  scenario 'when logged in' do
    fill_in(:message, with: 'My first peep')
    click_button 'Peep!'
    expect(page).to have_content('My first peep')
  end

  scenario 'cannot happen if logged out' do
    click_button('Log out')
    visit '/peeps'
    fill_in(:message, with: 'This peep shouldn\'t be here')
    click_button 'Peep!'
    expect(page).not_to have_content('This peep shouldn\'t be here')
    expect(page).to have_content('Oops! You need to be logged in to peep.')
  end

  scenario 'displays name and username' do
    fill_in(:message, with: 'My first peep')
    click_button 'Peep!'
    expect(page).to have_content('My first peep')
    expect(page).to have_content('Maker Makerson @makermakerson')
  end
end
