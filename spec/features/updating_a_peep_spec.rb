feature 'updating a peep' do
  scenario 'a user can update a peep' do
    peep = Peep.create(peep: 'update this', time: 'Time.new(2000)')
    visit '/peeps'
    expect(page).to have_content('update this')
    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/peeps/#{peep.id}/edit"
    fill_in('peep', with: "edit test peep for updating peeps")
    click_button('submit')
    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('update this')
    expect(page).to have_content('edit test peep for updating peeps')
  end
end
