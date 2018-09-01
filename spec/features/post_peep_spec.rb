feature 'posting peeps on chitter' do
  scenario 'a user can post a peep on chitter' do
    visit '/'
    fill_in :message, with: "Hello peeps!"
    click_button 'Post'
    expect(page).to have_content "Peeps"
    expect(page).to have_content "Hello peeps!"
  end
end
