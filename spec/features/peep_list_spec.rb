require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    PG.connect(dbname: 'chitter_test')
    Peep.create(fullname: 'John Jones', username: 'JJones', content: 'This is a test peep')
    Peep.create(fullname: 'Jack Billson', username: 'JBson', content: 'This is also a test peep')

    visit '/peeps'

    expect(page).to have_content('John Jones')
    expect(page).to have_content('JJones')
    expect(page).to have_content('This is a test peep')

    expect(page).to have_content('Jack Billson')
    expect(page).to have_content('JBson')
    expect(page).to have_content('This is also a test peep')
    end
  end
