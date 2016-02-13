# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Chitter wall:' do

  scenario 'User can choose to display or add peeps' do
    visit('/')
    expect(page).to have_selector(:button, count: 2)
  end

  scenario 'User can add a new peep' do
    visit('/')
    click_button 'Add peep'
      fill_in('peep_message', :with => 'Peep-peep-peep')
    click_button 'Peep it!'
  end

  scenario 'User gets confirmation of new peep added' do
    visit('/')
    click_button 'Add peep'
      fill_in('peep_message', :with => 'Peep-peep-peep')
    click_button 'Peep it!'
    expect(page).to have_content 'Peep-peep-peep'
  end

end

# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made