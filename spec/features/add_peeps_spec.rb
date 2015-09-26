
require './spec/factories/user'
require './spec/factories/peep'

feature 'Creating Peeps' do

  scenario 'As a user I can add a peep' do

    visit '/peeps/new'
    fill_in 'message', with: 'This is a new peep!'
    click_button 'Peep'
    peep = Peep.first
    expect(peep.message).to eq('This is a new peep!')

  end

end
