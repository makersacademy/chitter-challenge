feature 'See the feed' do
  scenario 'Can see peeps in reverse chronological order' do
    Peep.send(content: 'First', time: '2021-09-19 12:21:38', username: 'test')
    Peep.send(content: 'Last', time: '2002-09-19 18:21:38', username: 'test')
    Peep.send(content: 'Middle', time: '2018-09-19 18:21:38', username: 'test')

    peeps = Peep.feed
    visit '/'
    expect(peeps.length).to eq 3
    expect(peeps.first.time).to eq "2021-09-19 12:21:38"
    expect(peeps.first.content).to eq "First"
    expect(peeps.last.time).to eq "2002-09-19 18:21:38"
    expect(peeps.last.content).to eq "Last"

    expect(page).to have_content "First"
    expect(page).to have_content "Middle"
    expect(page).to have_content "Last"
  end
end