feature 'User can create a peep' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'peep',   with: 'beep beep beep'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('beep beep beep')
    end
  end
end
