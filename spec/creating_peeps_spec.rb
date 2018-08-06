feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit '/peeps/new'
    fill_in 'content', with: '123456'
    click_button('Peep')
    expect(page).to have_content('123456')
  end
end
