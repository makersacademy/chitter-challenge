feature 'user can write peeps and they display on the page' do
  scenario 'user can write a peep' do
    visit('/peep')
    fill_in('new_peep', with: 'Test peep')
    click_button('Submit')
    expect(page).to have_content('Test peep')
  end
end
