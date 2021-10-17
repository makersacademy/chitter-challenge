feature 'Tags from Peeps' do
  scenario 'a tag will not be created twice' do
    visit '/users/sign_up'
    fill_in('username', with: 'test_user')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    fill_in('text', with: '#test_tag today')
    click_button('Submit')

    fill_in('text', with: '#test_tag tomorrow')
    click_button('Submit')

    expect(page).to have_content("#test_tag", count: 3)
  end
end
