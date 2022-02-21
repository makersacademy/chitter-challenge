feature 'reverse order of peeps' do
  scenario 'show the peeps in reverse chronoligical order' do
    Peep.create(message: 'Hello everyone on Chitter')
    Peep.create(message: 'How is everyone doing?')
    visit('/peeps')
    latest_peep = first('.peeps').text
    expect(latest_peep).to eq 'How is everyone doing?'
  end
end