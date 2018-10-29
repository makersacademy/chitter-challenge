# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Viewing a Peep' do
  scenario 'a user can see a peep in the list' do
    register_user
    create_single_peep
    expect(page).to have_content("peeper1234Joe Bloggs\nWoohoo, I am peeping")
  end

  scenario 'a user can see multiple a peeps in the list' do
    register_user
    create_2_peeps
    expect(page).to have_content("peeper1234Joe Bloggs\nWoohoo, I am peeping")
    expect(page).to have_content("peeper1234Joe Bloggs\nThis is another peep")
  end
end
