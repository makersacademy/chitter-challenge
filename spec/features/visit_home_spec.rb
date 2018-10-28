feature 'visit the homepage' do
  scenario 'has a homepage with a title' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter, like Twitter, but Shitter 💩"
  end
end

feature 'see weets on homepage' do
  scenario 'see peeps from all users' do
    visit('/')
    expect(page).to have_content "My first peep!"
  end
end
