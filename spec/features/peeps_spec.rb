feature 'peeps' do
  scenario 'can post a peep' do
    visit('/new')
    fill_in('text', with: 'test peep')
    click_button('Submit')
    expect(current_path).to eq('/')
  end

  scenario 'view peeps in reverse chronological order' do
    visit('/new')
    fill_in('text', with: 'test peep')
    click_button('Submit')
    visit('/new')
    fill_in('text', with: 'test peep 2')
    click_button('Submit')
    expect(page).to have_content('test peep 2')
  end

  # scenario 'peeps show time posted' do
  #
  # end
end
