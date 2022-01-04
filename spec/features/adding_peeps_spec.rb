feature 'User can add a peep' do
  scenario 'User can add a new peep on the new peep page' do
    go_to_new_peep_page
    fill_in('content', with: 'This is my first peep')
    click_button('Peep It')
    expect(page).to have_content('This is my first peep')
  end
end
