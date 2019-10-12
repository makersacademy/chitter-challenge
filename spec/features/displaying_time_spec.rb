feature 'disply time' do
  scenario 'each post displays time of creation' do

    visit '/homepage'
    click_button 'New Post'

    fill_in 'content', with: 'This is a test post'
    click_button 'Submit'

    expect(page).to have_content Time
  end
end
