feature 'Adding peeps' do

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

  scenario 'I can create a peep' do
    visit '/peeps/new'
    fill_in 'Title', with: 'PeepCity'
    fill_in 'Message', with: 'This is PeepCity'
    click_button 'Peep!'
  end


end