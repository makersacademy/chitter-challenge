# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'View all peeps in reverse chronological order' do

  # As a user
  # So that I can be sure that peeps are placed in reverse order
  # I want to see my last peep at the top
  scenario 'I post two peeps and see the last one first' do
    peep
    peep(message: 'My second peep')
    within('div#peep', :match => :first) do
      expect(page).to have_content('My second peep')
    end
  end
end 
