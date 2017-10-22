feature 'replying to peeps' do

  text = 'Consequat ea in voluptate magna est veniam non laboris pariatur reprehenderit culpa consectetur.'
  
  scenario 'I can reply to a peep when logged in' do
    sign_up
    visit '/peeps/new'
    fill_in :peep, with: text
    click_button 'Post'
    log_out
    sign_up(email: 'test@email.com', handle: 'test_handle')
    visit '/'
    within '.peep_box' do
      click_button 'Reply'
    end
    fill_in :response, with: 'this is a response'
    click_button 'Post'
    within '.peep_box' do
      expect(page).to have_content 'this is a response'
    end        

  end

end
