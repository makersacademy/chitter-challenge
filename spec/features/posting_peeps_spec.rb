feature 'Adding a new peep' do

  scenario 'A user can post a peep' do
    visit('/peeps/new')
    fill_in('message', with: 'Having a great day!')
    click_button('Submit')

    expect(page).to have_content('Having a great day!')
  end

end
