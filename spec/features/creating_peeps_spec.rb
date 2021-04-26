feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hello World')
    click_button('Submit')
  
    expect(page).to have_content 'Hello World'
  end
end
