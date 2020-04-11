require 'peep'

feature 'Homepage loads with peeps' do
  
  scenario 'home has peeps' do
    peep_1 = Peep.create("Peep 1", '2020-04-10 10:52:57.960784')
    peep_2 = Peep.create("Peep 2", '2020-04-11 10:52:57.960784')
    visit '/home'
    expect(page).to have_content 'Peep 1 Peep 2'
  end

end