feature 'all' do
  scenario 'it should show all peeps in reverse chronological order' do
    visit '/'
    click_button 'Open Chitter App'
    fill_in('name', with: 'Anouska Hopkins')
    fill_in('username', with: 'ahopkins')
    fill_in('post', with: 'My first post')
    click_button 'submit'
    fill_in('name', with: 'Olivia Hopkins')
    fill_in('username', with: 'ohopkins')
    fill_in('post', with: 'My first post')
    click_button 'submit'
    expect(page). to have_content
  end
end
