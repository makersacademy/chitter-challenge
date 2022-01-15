# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Peeps display order' do
  scenario 'Makers view peeps in reverse chronological order' do
    
    add_three_peeps

    visit('/peeps')

    most_recent_peep = first('.peeps').text

    expect(most_recent_peep).to include 'peep: 3'
  end
end
