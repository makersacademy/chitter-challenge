feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page). to have_content('My first peep')
    end
  end

  scenario 'there are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

end
