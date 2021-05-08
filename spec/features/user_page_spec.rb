feature 'user account posts page' do
  scenario 'shows only the user posts' do
    user2 = User.create(name: 'test2', email: 'test2@test.com', username: 'testname2', password: 'Test222')
    Post.create(content: 'Other person post', user_id: user2.id)

    sign_up_and_get_posting

    click_button 'post'
    fill_in('post', with: 'Building Chitter')
    click_button 'Post'

    click_button 'post'
    fill_in('post', with: 'Writing tests')
    click_button 'Post'

    expect(page).to have_content 'Other person post'

    click_button 'My posts'

    expect(page).to have_content 'Building Chitter'
    expect(page).to have_content 'Writing tests'
    expect(page).not_to have_content 'Other person post'
  end
end
