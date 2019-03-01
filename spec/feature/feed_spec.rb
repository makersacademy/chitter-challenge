require './lib/peep.rb'

feature 'feed' do
  it 'should display all peeps' do
    peep1 = { content: 'Trump sucks' }
    Peep.create(peep1)

    peep2 = { content: 'Right???!!!' }
    Peep.create(peep2)
    
    visit('/feed')
    expect(page.all('.peep').count).to eq(2)
  end
end