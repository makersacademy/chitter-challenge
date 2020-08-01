feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do

    Peep.create('Wow it was hot yesterday...')
    Peep.create('Busy doing some coding today')
    Peep.create('Heading to the pub later!')

    visit '/peeps'
    peeps = Peep.all
    expect(peeps).to include 'Wow it was hot yesterday...'
    expect(peeps).to include 'Busy doing some coding today'
    expect(peeps).to include 'Heading to the pub later!'
  end
end
