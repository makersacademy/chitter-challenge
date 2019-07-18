feature 'allows a user to post a peep' do
  scenario 'post a peep' do
    visit('/')
    fill_in 'Whats on your mind?', with: 'first peep!'
    click_button("Post")
    expect(page).to have_content 'first peep!'
  end

  scenario 'seeing the time a next to a peep' do
    visit('/')
    fill_in 'Whats on your mind?', with: 'first peep!'
    click_button("Post")
    expect(page).to have_content Time.now
  end
end
