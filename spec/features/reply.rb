# As a maker
# In order to start a conversation
# I want to reply to a peep from another maker.

feature 'Replying to peeps' do
  scenario 'I can reply to a peep and see it' do
    sign_up
    log_in
    visit('/peeps/new')
    fill_in(:message, with: 'This is a test peep.')
    click_button('Post')
    click_button('Log out')
    sign_up(name: 'Vic', username: 'Reeves',
                email: 'vic@gmail.com'
    log_in(mail: 'chris.wynndow@gmail.com', password: 'password')
    visit('/peeps/new')
    click_link('Reply')
    fill_in(:message, with: 'This is a test reply.')
    click_button('Post')
    expect(page).to have_content('This is a test reply.')

  end




end
