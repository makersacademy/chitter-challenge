require 'peep'

feature 'Homepage loads with peeps' do
  
  scenario 'home has peeps' do
    peep_1 = Peep.create("Peep 1")
    peep_2 = Peep.create("Peep 2")
    visit '/home'
    expect(page).to have_content 'Peep 1 Peep 2'
  end

end