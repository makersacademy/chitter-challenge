# # As a maker
# # So that I can see what others are saying
# # I want to see all peeps in reverse chronological order
feature '2. Viewing Peeps' do
  scenario 'User can view peeps' do
    Peep.create(text: "This is peep 1")
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
  end

  # scenario 'User can view newest peeps first' do
  #   Peep.create(text: "This is peep 1")
  #   Peep.create(text: "This is peep 2")
  # end
end
