feature 'messages' do
  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario 'post a message' do
    login
    new_peep
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Peep this'
  end
  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'list peeps in reverse chronological order' do
    login
    new_peep
    visit '/peeps/new'
    fill_in 'peep', with: 'More peeps'
    click_button 'Add Peep'
    page.body.index('More peeps').should < page.body.index('Peep this')
  end
  # As a maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  # scenario 'displays time of peep' do
  #   new_peep
  #   expect(page).to
  # end
end
