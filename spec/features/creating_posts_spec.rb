feature 'posting a post' do
  scenario 'post visible after posting' do
    sign_up_and_get_posting

    click_button 'post'
    fill_in('post', with: 'Building chitter')
    click_button 'Post'

    expect(page).to have_content('Building chitter')
    expect(current_path).to eq('/posts')
  end
end
