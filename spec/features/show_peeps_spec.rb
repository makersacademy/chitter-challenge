feature 'show peeps' do
  scenario 'all peeps are shown in reverse chronological order' do
    Peep.create(text: 'First test peep')
    Peep.create(text: 'Second test peep')
    Peep.create(text: 'Third test peep')

    visit('/peeps')

    expect(first('.peep')).to have_content('Third test peep')
    expect(all('.peep')[1]).to have_content('Second test peep')
    expect(all('.peep')[2]).to have_content('First test peep')
  end
end
