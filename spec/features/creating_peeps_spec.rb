feature 'creating peeps' do
  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'new_peep', with: 'this is my test peep'
    click_on 'Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('this is my test peep')
    end
  end
end
