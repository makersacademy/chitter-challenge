feature 'Viewing Posts' do
  scenario 'User can see posts on homepage' do
    Post.create(title: 'A first go', post: 'Chittery Do Dah! What a great app!', name: 'thatdania')
    visit('/home')
    expect(page.status_code).to eq 200
    expect(page).to have_content('A first go: Chittery Do Dah! What a great app! ~@thatdania')
  end
end
