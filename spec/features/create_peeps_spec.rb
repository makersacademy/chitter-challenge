feature 'Create peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message',   with: 'a new peep'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('a new peep')
  end
end
