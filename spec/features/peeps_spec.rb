feature 'peeps' do
  scenario 'can post a peep' do
    visit('/new')
    fill_in('text', with: 'test peep')
    click_button('Submit')
    expect(current_path).to eq('/')
  end

  scenario 'view peeps' do
    visit('/new')
    fill_in('text', with: 'test peep')
    click_button('Submit')
    expect(current_path).to eq('/')
    expect(page).to have_content('test peep')
  end

  # scenario 'peeps show time posted' do
  #
  # end
end
