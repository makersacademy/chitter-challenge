feature 'Allow a user to peep' do
  scenario 'A user can post a peep' do
    visit('/peeps')
    fill_in('peep', with: 'My first peep')
    click_button('Peep That')
    expect(page).to have_content 'My first peep'
  end
end
