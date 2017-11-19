feature 'post peeps' do
  scenario 'adding a peep' do
    visit '/peeps/new'
    fill_in 'mess', with: 'Wow such a sunny day'
    click_button 'Add peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Wow such a sunny day')
    end
  end
end
