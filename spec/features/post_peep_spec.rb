require 'peep'

feature 'Homepage loads with peeps' do
  
  scenario 'home has peeps' do
    peep_1 = Peep.create("Peep 1", '2020-04-10 10:52:57.960784', 'Bruce123', 'Bruce')
    peep_2 = Peep.create("Peep 2", '2020-04-11 10:52:57.960784', 'Jim798', 'Jim')
    visit '/home'
    expect(page).to have_content 'Peep 2 Jim @Jim798 2020-04-11 Peep 1 Bruce @Bruce123 2020-04-10'
  end

end