feature 'Tags from Peeps' do
  scenario 'a tag will not be created twice' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')
    visit '/'
    click_button 'Sign In'
    fill_in('username', with: 'test_user')
    fill_in('password', with: 'password123')
    click_button('Submit')

    fill_in('text', with: '#test_tag today')
    click_button('Submit')

    fill_in('text', with: '#test_tag tomorrow')
    click_button('Submit')

    expect(page).to have_content("#test_tag", count: 3)
  end
end
