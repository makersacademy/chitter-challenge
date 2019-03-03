feature 'User can post peeps' do
  scenario 'Fill in and submit peep form' do
    visit('/')
    fill_in 'peep', with: 'This is a peep post'
    click_button 'Post'
    expect(page).to have_content("This is a peep post")
  end
end
