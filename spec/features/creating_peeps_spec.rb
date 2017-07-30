# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting peeps' do
  scenario 'I can post a peep to chitter' do
    visit '/peeps/new'
    # fill_in 'name', with: 'Suzy'
    # fill_in 'username', with: '@sultrysuzy'
    fill_in 'peep', with: 'Creating a new peep'
    click_button 'Create peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Creating a new peep')
    end
  end
end
