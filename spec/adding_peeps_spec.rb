feature 'Adding peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'peep',   with: 'I love a good peep'
    click_button 'Add peep'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('I love a good peep')
    end
  end
end
