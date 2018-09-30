describe 'Chitter Features' do
  # As a maker
  # So that I can see what others are saying  
  # I want to see all peeps in reverse chronological order

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  
  feature 'The user can see all peeps on the page' do
    scenario "the user can see other users' peeps" do
      Peep.create(message: 'test peep 1')
      Peep.create(message: 'test peep 2')
      Peep.create(message: 'test peep 3')
      visit '/'
      expect(page.status_code).to eq(200)
      expect(page).to have_content('test peep 1')
      expect(page).to have_content('test peep 2')
      expect(page).to have_content('test peep 3')
    end 
    scenario 'the user sees peeps in reverse chronological order' do
      # possible?
    end
    scenario 'the user sees the timestamp attached to each peep' do
      peep = Peep.create(message: 'test peep 1')
      visit '/'
      expect(page.status_code).to eq(200)
      expect(page).to have_content(peep.formatted_time)
    end
  end

end
