feature 'Creating a post on Chitter' do
  scenario 'User can create a post on Chitter' do
    fill_in_first
    expect(current_path).to eq('/home')
    expect(page).to have_content('First: Chittery Do Dah! What a great app! ~@thatdania')
  end
end

feature 'Showing most recent post created on Chitter' do
  scenario 'Users post shows up first on Chitter' do
    fill_in_first
    fill_in_second
    expect(current_path).to eq('/home')
    expect(page.body.index('Second')).to be < page.body.index('First')
 end
end
