feature 'Post a message' do
  scenario 'A user can post a message' do
    visit('/')
    fill_in('peep', with: "Hey guys.")
    click_button('Cheep')
    expect(page).to have_content("Hey guys.")
  end
end
