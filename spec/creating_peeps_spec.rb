# User Story 1.
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Add new peeps' do
  scenario 'to let people know what user is doing' do
    visit '/peeps/new'
    fill_in 'peep', with: 'I am the night!'
    click_button 'Create peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('I am the night!')
    end
  end
end
