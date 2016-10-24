feature 'Creating Peeps' do

  scenario 'the user can create a new peep' do
    visit '/peeps/new'
    fill_in 'author', with: 'James'
    fill_in 'comment', with: 'My first new peep'
    click_button 'Create Peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('My first new peep')
    end

  end

end
