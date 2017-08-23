=begin
As a user
So that I can post a peep
I want to submit my peeps to my Chitter.
=end

feature 'Posting messages' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'Title',   with: 'My first message'
    fill_in 'Message', with: 'I love Pentatonix'
    click_button 'Peep Peep'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('I love Pentatonix')
    end
  end
end
