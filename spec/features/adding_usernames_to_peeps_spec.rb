feature 'Adding usernames to peeps' do

  scenario 'My username is displayed with my peep' do
    visit '/peeps/new'
    fill_in 'peep', with: 'just peeping'
    click_button 'Peep'
    peep = Peep.first
    expect(peep.tags).to include(:username)
  end

end
