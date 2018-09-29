describe 'Chitter Features' do

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
  end

end
