require './lib/peep.rb'

feature 'feed' do
  it 'should display all peeps' do
    peeps = create_peeps
    
    visit('/feed')
    expect(page.all('.peep').count).to eq(peeps.count)
  end
end
