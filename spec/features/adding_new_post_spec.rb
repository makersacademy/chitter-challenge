feature 'Adding a new post' do
  scenario 'A user can click a button and add a new post' do
    visit("/user")
    fill_in('new_post', with: 'This is yet another post')
    click_button('POST')
    visit('/user')
    expect(page).to have_content 'This is yet another post'
  end
end
