feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/')
    fill_in('peep_content', with: 'This is a new tweet')
    click_button('Post Peep')
    click_button('Homepage')
    expect(current_path).to eq '/'
    expect(page).to have_content 'This is a new tweet'
  end
end
