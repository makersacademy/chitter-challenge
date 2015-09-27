feature 'Creating peeps' do

  scenario 'create a new peep' do
    visit '/peeps/new'
    fill_in "message", with: 'This is the first peep'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page). to have_content('This is the first peep')
    end
  end

end
