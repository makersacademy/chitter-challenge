feature '## Views Time Line' do
  scenario 'user views the timeline' do
    visit '/timeline'
    expect(page).to have_content('Chitter Timeline')
  end
end