feature 'view Chitter' do
  scenario 'visit Chitter page and see a list of peeps' do
    visit '/chitter'

    expect(page).to have_content('Chitter')
    expect(page).to have_content('Fake news!')
    expect(page).to have_content("Sun's out, guns out")
  end
end
