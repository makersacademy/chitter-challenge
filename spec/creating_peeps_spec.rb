feature 'Creating Peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'user',   with: 'gimtron'
    fill_in 'message', with: 'Tasty Sandwiches'
    click_button 'Create Peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Tasty Sandwiches')
    end
  end

end
