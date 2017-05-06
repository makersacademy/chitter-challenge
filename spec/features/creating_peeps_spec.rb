feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in :username,   with: 'jessica123'
    fill_in :peep, with: 'My first peep'
    click_button 'Create peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('My first peep')
    end
  end
end
