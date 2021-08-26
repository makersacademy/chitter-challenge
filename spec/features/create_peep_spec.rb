feature 'create new peep' do
  scenario 'user can add peep and see it' do
    visit('/peeps')
    fill_in('peep', with: 'this is a test peep')
    click_button('Peep')
    expect(page).to have_content("this is a test peep")
  end
end
