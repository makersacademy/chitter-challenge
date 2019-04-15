feature 'Adding a new post' do
  scenario 'A user can add a post to chitter' do
    visit('/posts/new')
    fill_in('post', with: 'hello chitter')
    click_button('post')

    expect(page).to have_content 'hello chitter'
  end
end
