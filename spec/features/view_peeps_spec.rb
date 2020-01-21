require 'orderly'

feature 'Viewing peeps' do
  scenario 'A user can see all peeps in reverse chronological order' do
    Peep.create('First peep')
    Peep.create('Second peep')

    visit '/peeps'

    expect(page).to have_content 'First peep'
    expect(page).to have_content 'Second peep'
    expect('Second peep').to appear_before('First peep')
  end
end
