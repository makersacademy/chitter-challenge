# As a maker
# In order to start a conversation
# I want to reply to a peep from another maker.

feature 'Replying to peeps' do
  scenario 'I can reply to a peep and view it' do
    sign_up
    log_in
    visit('/peeps/new')
    fill_in(:message, with: 'This is a test peep.')
    click_button('Post')
    click_button('Log out')
    sign_up(name: 'Vic', username: 'Reeves',
                email: 'vic@gmail.com')
    log_in(email: 'chris.wynndow@gmail.com', password: 'password')
    visit('/peeps')
    click_link('Reply')
    fill_in(:message, with: 'This is a test reply.')
    click_button('Post')
    expect(page).to have_content('This is a test reply.')
  end

  scenario 'Replys to peeps are displayed beneath the original' do
    sign_up
    log_in
    visit('/peeps/new')
    fill_in(:message, with: 'This is a test peep.')
    click_button('Post')
    click_button('Log out')
    sign_up(name: 'Vic', username: 'Reeves',
                email: 'vic@gmail.com')
    log_in(email: 'chris.wynndow@gmail.com', password: 'password')
    visit('/peeps')
    click_link('Reply')
    fill_in(:message, with: 'This is a test reply.')
    click_button('Post')
    within('ul.replies') do
      expect(page).to have_content('This is a test reply.')
    end
  
  end




end
