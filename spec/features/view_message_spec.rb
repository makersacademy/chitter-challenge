feature 'Viewing messages' do
  scenario 'A user can see messagges' do
    Peep.create(message: 'Have a nice day.')
    visit('/peeps')

    expect(page).to have_content "Have a nice day."
  end
end