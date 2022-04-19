# User story
# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Viewing public stream chronologically' do
  scenario 'A user can see all peeps in reverse chonological order' do
    Peep.create(content: 'This is a test peep!')
    Peep.create(content: 'This is another test peep!')
    Peep.create(content: 'Yet another test peep!')

    visit '/peeps'
    
    expect(page).to have_content /Yet another test peep!.*This is another test peep!.*This is a test peep!/

  end
end
