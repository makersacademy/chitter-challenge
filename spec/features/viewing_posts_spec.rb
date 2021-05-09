feature 'viewing posts' do
  scenario 'posts visible when not logged in' do
    User.create(name: 'test1', email: 'test1@test.com',
      username: 'testname1', password: 'Test111')

    Post.create(content: 'Building Chitter', user_id: 1)
    Post.create(content: 'Taking a break', user_id: 1)
    Post.create(content: 'Writing tests', user_id: 1)

    visit '/posts'

    expect(page).not_to have_content 'Hello test1!'
    expect(page).to have_button 'Sign In'
    expect(page).to have_content 'Building Chitter'
    expect(page).to have_content 'Taking a break'
    expect(page).to have_content 'Writing tests'
  end

  scenario 'username and name of poster is displayed' do
    sign_up_and_get_posting

    click_button 'post'
    fill_in('post', with: 'Building Chitter')
    click_button 'Post'

    expect(first('.post')).to have_content 'test_name'
    expect(first('.post')).to have_content 'test'
    expect(first('.post')).to have_content 'Building Chitter'
    expect(current_path).to eq '/posts'
  end
end
