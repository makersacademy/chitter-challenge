feature 'create a peep' do
  scenario 'as a user I want to create peeps' do
    log_in
    click_link('Create Peep')
    fill_in('peep', with: 'This is Peep 1')
    click_button('Peep')
    expect(page).to have_content('This is Peep 1')
  end
end
