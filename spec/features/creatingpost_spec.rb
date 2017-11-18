feature 'Creating a post on Chitter' do
  scenario 'User can create a post on Chitter' do
    visit '/newpost'
    fill_in 'title', with: 'A first go'
    fill_in 'post', with: 'Chittery Do Dah! What a great app!'
    fill_in 'name', with: 'thatdania'
    click_on('Create Post')
    expect(current_path).to eq('/home')
    expect(page).to have_content('A first go: Chittery Do Dah! What a great app! ~@thatdania')
  end
end
