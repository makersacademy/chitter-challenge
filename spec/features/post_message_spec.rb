# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Post message' do
  before do
    sign_up
    log_in
  end

  scenario 'when logged in' do
    post_message
    expect(page).to have_content('My first peep')
  end

  scenario 'cannot happen if logged out' do
    click_button('Log out')
    post_message
    expect(page).not_to have_content('My first peep')
    expect(page).to have_content('Oops! You need to be logged in to peep.')
  end

  scenario 'displays name and username' do
    post_message
    expect(page).to have_content('My first peep')
    expect(page).to have_content('Maker Makerson @makermakerson')
  end
end
