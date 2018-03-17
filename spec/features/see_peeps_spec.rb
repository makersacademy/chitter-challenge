feature 'Main page has jumbotron' do
  scenario 'User visits main page' do
    visit('/')
    expect(page).to have_content "ChitterBox"
    expect(page).to have_content "Responsive chat app using using bootstrap, sinatra and Postgres for DB."
  end
end
