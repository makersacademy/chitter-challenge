feature 'Main page has jumbotron' do
  scenario 'User visits main page' do
    visit('/')
    expect(page).to have_content "ChitterBox"
    expect(page).to have_content "Responsive chat app using using bootstrap, sinatra and Postgres for DB."
  end
end

feature 'Main page has peeps' do
  scenario 'User visits main page and sees previous peeps' do
    visit('/')
    expect(page).to have_content "this is first peep"
    expect(page).to have_content "this is the second peep"
    expect(page).to have_content "this is the third peep"
  end
end
