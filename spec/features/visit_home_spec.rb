feature 'visit the homepage' do
  scenario 'has a homepage with a title' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter, like Twitter, but Shitter 💩"
  end
end
