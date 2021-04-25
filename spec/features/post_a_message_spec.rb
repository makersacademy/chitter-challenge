feature 'posting a message' do
  scenario 'posting a message appears on timeline' do
    visit '/'
    sign_up_and_submit
    sign_in
    click_button 'New post'
    fill_in('new_post', with: 'Hello World!')
    click_button 'Submit'
    expect(page).to have_content 'Hello World!'
  end

  scenario 'expect newest messages to appear first' do
    visit '/'
    sign_up_and_submit
    sign_in
    click_button 'New post'
    fill_in('new_post', with: 'Test1')
    click_button 'Submit'
    click_button 'New post'
    fill_in('new_post', with: 'Test2')
    click_button 'Submit'
    expect(page.body.index('Test1')).to be > page.body.index('Test2')
  end

  scenario 'expect messages to contain time they were created' do
    visit '/'
    sign_up_and_submit
    sign_in
    click_button 'New post'
    fill_in('new_post', with: 'Test1')
    click_button 'Submit'
    time = DateTime.now.strftime("%H:%M %b %e")
    expect(page).to have_content("at #{time}")
  end

  scenario 'Error if trying to post message without being logged in' do
    visit '/'
    click_button 'New post'
    expect(page).to have_content('You must be signed in to post.')
  end
end
