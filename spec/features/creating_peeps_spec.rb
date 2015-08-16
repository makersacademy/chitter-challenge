feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'content', with: 'This is my first peep'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep')
    end
  end
end
