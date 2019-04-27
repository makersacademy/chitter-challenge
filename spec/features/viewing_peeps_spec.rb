require 'pg'

feature 'Viewing Peeps' do
  scenario 'see all peeps in reverse chronological order' do
    Peep.create(content: 'peep 6/1')
    Peep.create(content: 'peep 5/1')
    Peep.create(content: 'peep 4/1')
    Peep.create(content: 'peep 3/1')
    Peep.create(content: 'peep 2/1')
    Peep.create(content: 'peep 1/1')

    visit('/peeps')

    expect(page).to have_content 'peep 6/1'
    expect(page).to have_content 'peep 5/1'
    expect(page).to have_content 'peep 4/1'
    expect(page).to have_content 'peep 3/1'
    expect(page).to have_content 'peep 2/1'
    expect(page).to have_content 'peep 1/1'
  end
end
