feature 'Adding a peep and viewing details' do
  scenario 'name and username appear together with the message' do
    login_in_and_peep

    expect(page).to have_content('Pikachu - @mightypikachu')
  end
end
