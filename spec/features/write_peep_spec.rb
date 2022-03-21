feature 'writing a peep' do
  scenario 'there is a form to write a peep' do
    visit('/write')

    expect(page).to have_field("peepbox")
  end

  scenario 'there is a button to submit the peep' do
    visit('/write')

    expect(page).to have_button("Peep!")
  end

  scenario 'user can write a peep that will be added to the list of peeps' do
    visit('/write')
    fill_in('peepbox', with: 'Ed Balls')
    click_button('Peep!')

    expect(page).to have_content('Ed Balls')
  end
end
