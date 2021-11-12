feature 'Viewing messages' do
  scenario 'A user can see messagges' do
    visit('/peeps')

    expect(page).to have_content "Have a nice day."
  end
end