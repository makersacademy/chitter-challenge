feature 'creating a peep' do
  scenario 'shows on the screen' do
    visit '/peeps/new'
    fill_in('peep', with: 'Hello world!')
    click_button('Peep!')
    expect(page).to have_content('Hello world!')
  end
end
