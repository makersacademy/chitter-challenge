require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(content: "Hello, working on my Chitter weekend-challenge", user_name: 'Tomas')
    Peep.create(content: "Getting, started with my Chitter, and my second post.", user_name: 'Elena')

    visit('/peeps')

    expect(page).to have_content "Hello, working on my Chitter weekend-challenge"
    expect(page).to have_content "Tomas"
    expect(page).to have_content "Getting, started with my Chitter, and my second post."
    expect(page).to have_content "Elena"
  end
end