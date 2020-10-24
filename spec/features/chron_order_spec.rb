require 'orderly'

feature 'chronological order' do
  scenario 'peeps on the homepage appear in reverse chronological order' do
    Peep.create(peep: 'last')
    Peep.create(peep: 'third')
    Peep.create(peep: 'second')
    visit '/chitter/home'
    fill_in('newpeep', with: "")
    fill_in('newpeep', with: "first")
    click_on('Submit')
    expect('first').to appear_before('second')
    expect('third').to appear_before('last')
  end
end
