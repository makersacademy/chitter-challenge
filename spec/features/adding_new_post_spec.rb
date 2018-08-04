feature 'Adding a new post' do
  scenario 'A user can click a button and add a new post' do
    visit("/user")
    click_button('new post')
    fill_in('new_post', with: 'This is yet another post')
    click_button('post')
    expect(page).to have_content 'Yet another post'
  end
end
