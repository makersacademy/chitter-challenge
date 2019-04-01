
feature 'Adding a new Peep' do
  scenario 'A user can add a Peep to the Peep feed' do
    visit('/feed/create')
    fill_in('content', with: 'Peep 4')
    click_button('Submit')

    expect(page).to have_content 'Peep 4'
  end
end
