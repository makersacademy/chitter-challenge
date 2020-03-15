feature 'viewing peeps in reverse chronological order' do
  scenario 'user can see a list of peeps, visits the index page' do
    visit('/chitter')
    
    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end
end

  # As a maker
  # So that I can see what others are saying  
  # I want to see all peeps in reverse chronological order

  