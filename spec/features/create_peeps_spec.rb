feature "Adding a new peep" do
  scenario 'A user can add a new peep to chitter' do 
    visit('/chitter/index')
    fill_in('peeps', with: 'Peep 4')
    
