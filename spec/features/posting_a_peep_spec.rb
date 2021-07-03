feature 'posting a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps')
    fill_in('peep', with: 'Hello Fiday!')
    click_button('Click to post')

    expect(page).to have_content('Hello Friday!')
  end
end
