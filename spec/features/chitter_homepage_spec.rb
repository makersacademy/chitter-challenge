feature '/chitter' do
  scenario 'homepage shows peeps' do
    visit '/chitter'
    expect(page).to have_content('peep2')
  end
  scenario 'peeps have time they were made' do
    visit '/chitter'
    expect(page).to have_content('peep1 2020-06-06 11:10:25')
  end
end
