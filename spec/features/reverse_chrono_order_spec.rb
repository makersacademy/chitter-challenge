feature 'posts appear in reverse chronological order' do
  scenario '3 posts displayed by most recent first' do
    sign_up_and_get_posting

    click_button 'post'
    fill_in('post', with: 'Building Chitter')
    click_button 'Post'

    click_button 'post'
    fill_in('post', with: 'Taking a break')
    click_button 'Post'

    click_button 'post'
    fill_in('post', with: 'Writing tests')
    click_button 'Post'

    expect(first('.post')).to have_content 'Writing tests'
    expect(all(:css, '.post').last).to have_content 'Building Chitter'
    expect(page).to have_content 'Building Chitter'
    expect(all(:css, '.post').count).to be 3
  end
end
