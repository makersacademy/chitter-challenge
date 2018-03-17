feature 'Main (Peep) page has jumbotron' do
  scenario 'User visits peeps page' do
    visit('/peeps')
    expect(page).to have_content "ChitterBox"
    expect(page).to have_content "Responsive chat app using using bootstrap, sinatra and Postgres for DB."
  end
end

feature 'Main (Peep) page has peeps' do
  scenario 'User visits main page and sees previous peeps' do
    visit('/peeps')
    expect(page).to have_content "This is first peep."
    expect(page).to have_content "This is second peep."
    expect(page).to have_content "This is third peep."
  end
end
