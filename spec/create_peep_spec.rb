feature 'create a new peep' do

  scenario 'user can create a new peep' do
    visit('/peeps/new')
    fill_in('new_peep', :with => 'test')
    click_button('PEEP')
    expect(current_path).to eq('/peeps/all')
    expect(page).to have_content 'test'
  end
end
