feature 'New Peep!' do
  scenario 'A user can add a new peep by clicking the New Peep button' do
    visit('/peeps')
    click_link('New Peep!')
    fill_in('Message', with: 'New peep by Cinnamon Roll')
    click_button('Add Peep!')

    expect(page).to have_content 'New peep by Cinnamon Roll'
  end
end