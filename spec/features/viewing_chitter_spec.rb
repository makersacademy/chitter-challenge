feature 'Viewing chitter' do
  scenario 'the peeps are visible' do
    visit('/peeps')

    expect(page).to have_content "This is Peep 1"
    expect(page).to have_content "This is Peep 2"
  end
end
