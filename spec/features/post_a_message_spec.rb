feature 'posting a message' do
  scenario 'posting a message appears on timeline' do
    visit '/'
    click_button 'New post'
    fill_in('new_post', with: 'Hello World!')
    click_button 'Submit'
    expect(page).to have_content 'Hello World!'
  end

  scenario 'expect newest messages to appear first' do
    visit '/'
    click_button 'New post'
    fill_in('new_post', with: 'Test1')
    click_button 'Submit'
    click_button 'New post'
    fill_in('new_post', with: 'Test2')
    click_button 'Submit'
    expect(page.body.index('Test1')).to be > page.body.index('Test2')
  end
end
