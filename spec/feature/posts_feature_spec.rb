feature 'posts' do
  scenario 'filling in post fields results in post appearing' do
    visit('/posts/new')
    fill_in('title', with: 'Test Post')
    fill_in('post', with: 'This is a test Chitter post')
    click_button('Post')
    expect(page).to have_content('This is a test Chitter post')
  end
end
