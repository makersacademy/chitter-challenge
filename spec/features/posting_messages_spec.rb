feature 'Posting messages' do
  scenario 'user can post messages' do
    visit('/messages')
    fill_in :content, with: "This is a very important message"
    click_button "Post"
    expect(page).to have_content "This is a very important message"
  end
end