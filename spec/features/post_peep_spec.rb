feature 'post a peep' do
  scenario 'can post a peep' do
    visit('/new')
    fill_in('text', with: 'test peep')
    click_button('Submit')
    expect(current_path).to eq('/')
  end

  # scenario 'view peeps in reverse chronological order' do
  #
  # end
  #
  # scenario 'peeps show time posted' do
  #
  # end
end
