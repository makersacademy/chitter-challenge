# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Chitter wall:' do

  scenario 'See all peeps through home in reverse order' do
    see_wall
    expect(page).to have_content 'All peeps:'
  end

  scenario 'See all peeps through confirmation page' do
    fill_form
    click_button 'Show peeps'
    expect(page).to have_content 'All peeps:'
  end
  
end


# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made