feature 'writing a peep' do
  scenario 'there is a form to write a peep' do
    visit('/write')

    expect(page).to have_field("peep")
  end

  scenario 'there is a button to submit the peep' do
    visit('/write')

    expect(page).to have_button("Peep!")
  end
end
