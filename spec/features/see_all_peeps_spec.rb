require 'peep'

feature 'see all peeps in reverse chronological order' do
  scenario 'when visiting the peeps path, you can see all peeps in reverse chronological order' do
    maker = Maker.create('Su', 'Fox', 'there@here.com', '1234')
    Peep.create('My first peep', Time.now, maker.id)
    Peep.create('My second peep', Time.now, maker.id)
    visit '/peeps'

    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'My second peep'
    expect(page.body.index('My first peep')).to be < page.body.index('My second peep')
  end
end
