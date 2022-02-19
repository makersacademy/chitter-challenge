# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep' do
  scenario 'user posts a peep to chitter' do
    visit('/')
    fill_in 'new_peep', with: 'Here\'s a new peep for you'
    click_button('Send peep')
    expect(page).to have_content 'All the peeps so far'
  end
end
