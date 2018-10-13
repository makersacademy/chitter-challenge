feature 'Features - Retrieve peeps' do
  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'user wants to see all peeps in reverse chronological order' do
    Peep.create(peep: 'my first peep')
    Peep.create(peep: 'my second peep')
    visit('/all_peeps')
    expect(page.body.index('my first peep')).to be > (page.body.index('my second peep'))
  end

  scenario 'user wants to see when a peep was sent' do
    visit('/all_peeps')
    peep = Peep.create(peep: 'my first peep, hurray!')
    expect(peep.created_at).to be_within(2.seconds).of(Time.now)
  end
end
