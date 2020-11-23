require 'pg'

feature 'Reading peeps' do
  scenario 'see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(post: 'Hello world, this is my first peep')
    Peep.create(post: 'I am going to let people know what I am doing')
    Peep.create(post: 'Every little thing')

    visit('/peeps')
    expect(page).to have_content('Hello world, this is my first peep')
    expect(page).to have_content('I am going to let people know what I am doing')
    expect(page).to have_content('Every little thing')
  end
end
