feature 'editing posts' do
  scenario 'post has changed after editing' do
    sign_up_and_get_posting

    click_button 'post'
    fill_in('post', with: 'Building Chitter')
    click_button 'Post'

    click_button 'post'
    fill_in('post', with: 'Writing tests')
    click_button 'Post'

    expect(page).to have_content 'Building Chitter'
    expect(page).to have_content 'Writing tests'

    click_button 'My posts'

    first('.post').click_button 'Edit'

    fill_in('post', with: 'Making lunch!')
    click_button 'Save'

    expect(page).not_to have_content 'Writing tests'
    expect(page).to have_content 'Making lunch!'

    click_button 'Back to Feed'

    expect(page).not_to have_content 'Writing tests'
    expect(page).to have_content 'Making lunch!'
    expect(current_path).to eq '/posts'
  end
end
