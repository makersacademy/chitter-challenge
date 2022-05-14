feature 'Adding a new peep' do
  scenario 'user can add a new peep to Chitter' do
    visit '/peeps/new'
    fill_in 'body', with: 'my first peep'
    click_button 'Peep'

    expect(page).to have_content 'my first peep'
  end
end