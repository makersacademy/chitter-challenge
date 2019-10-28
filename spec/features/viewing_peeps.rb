require 'pg'

feature 'viewing peeps' do
  scenario 'peeps are visible' do
    Peep.create(peep: 'hello my name is Adam')

    visit '/bookmarks'

    expect(page).to have_content('hello my name is Adam')
    end
  end
