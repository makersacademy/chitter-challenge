require 'pg'

feature 'Viewing peeps in reverse order' do
  scenario 'Most recent peep at the top' do
    Peep.create(message: 'peep 1')
    Peep.create(message: 'peep 2')
    Peep.create(message: 'peep 3')
    visit '/peeps'

    newest_peep = first('.peeps').text
    expect(newest_peep).to eq 'peep 3'
  end
end
