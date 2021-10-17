
feature 'User can add a peep' do
  scenario 'User should be able to go to the new peep page' do
    go_to_new_peep_page
    expect(page).to have_current_path('/peeps/new?write_peeps=Write+new+Peep')
  end

  scenario 'User can add a new peep on the peep page' do
    go_to_new_peep_page
    fill_in('content', with: 'This is my first peep')
    click_button('Peep It')
    expect(page).to have_content('This is my first peep')
  end
end
