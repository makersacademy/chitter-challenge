require 'peep'

feature 'see all peeps in reverse chronological order' do
  scenario 'when visiting the peeps path, you can see all peeps in reverse chronological order' do
    Peep.create('My first peep', Time.now)
    Peep.create('My second peep', Time.now)
    visit '/peeps'

    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'My second peep'
    expect(page.body.index('My first peep')).to be < page.body.index('My second peep')
  end
end
