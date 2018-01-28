feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/newpeep'
    fill_in 'name',   with: 'Alex'
    fill_in 'message', with: 'This is a new message'
    click_button 'Create peep'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Alex')
    end
  end
end
