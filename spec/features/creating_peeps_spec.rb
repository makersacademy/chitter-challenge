require './app/models/peep.rb'

feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'This is my second peep!'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is my second peep!')
    end
  end
end
