feature '/chitter' do
  scenario 'homepage shows pieps' do
    visit '/chitter'
    expect(page).to have_content('piepje2')
  end
  scenario 'pieps have time they were made' do
    visit '/chitter'
    expect(page).to have_content('piepje1 2020-06-06 11:10:25')
  end
end
