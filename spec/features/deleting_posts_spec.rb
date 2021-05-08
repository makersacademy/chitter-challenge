feature 'deleting posts' do
  scenario 'post no longer visible after deleting' do
    sign_up_and_get_posting

    click_button 'post'
    fill_in('post', with: 'Building Chitter')
    click_button 'Post'
    click_button 'My posts'

    expect(page).to have_content 'Building Chitter'

    click_button 'Delete'

    expect(page).not_to have_content 'Building Chitter'
  end
end
