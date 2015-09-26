feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'peep', with: 'This is a peep'
    click_button 'Peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is a peep')
    end
  end

  scenario 'There are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

end
