feature '/chitter/add_peep' do
  scenario 'can add a new peep' do
    visit '/chitter'
    click_button('new peep')
    fill_in('text', with: 'peep3')
    click_button('Submit')
    expect(page).to have_content('peep3')
  end
end
