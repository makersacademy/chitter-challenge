require 'pry'

feature 'View peeps' do
  scenario 'User can view peeps in reverse chronological order' do
    Peep.create(content: 'I love chocolate')
    Peep.create(content: 'I love champagne')
    Peep.create(content: 'I love Makers')

    visit '/peeps'

    peeps = page.all('.peeps')
    expect(peeps.count).to eq 3
    expect(peeps[0].text).to eq 'I love Makers'
    expect(peeps[1].text).to eq 'I love champagne'
    expect(peeps[2].text).to eq 'I love chocolate'
  end
end
