feature '/chitter' do
  scenario 'homepage shows peeps' do
    visit '/chitter'
    expect(page).to have_content('peep1')
  end
end
