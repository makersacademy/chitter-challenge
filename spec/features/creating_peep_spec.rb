feature 'Creating Peeps' do

  scenario 'can post a new peep to Chitter' do
    visit '/peeps/new_peep'
    fill_in 'text', with: 'peep message'
    click_button 'Submit peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('peep message')
    end
  end
end
