require './app/models/peep'

feature 'creating peeps' do

  scenario 'I can create a peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'This is a test peep'
    click_button 'Send peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is a test peep')
    end
  end
end
