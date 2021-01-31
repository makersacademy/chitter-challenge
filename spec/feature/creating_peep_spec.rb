require 'pg'

feature "create peeps" do
  scenario "I want to post a message (peep) to Chitter homepage" do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/')
    fill_in('content', with: 'This is my first peep')
    click_button('Post Peep')

    expect(page).to have_content('This is my first peep')
  end

  scenario "I want my peep to have a time stamp when posted" do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/')
    fill_in('content', with: 'This is my first peep')
    click_button('Post Peep')

    expect(page).to have_content('This is my first peep')
  end

end
