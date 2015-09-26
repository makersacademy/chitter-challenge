feature 'Adding peeps:' do

  scenario 'I can add a peep' do
    visit '/'
    fill_in :message, with: 'Leave them alone and they\'ll come home'
    click_button 'Peep'
    within 'div#peeps' do
      expect(page).to have_content('Leave them alone and they\'ll come home')
    end
  end

  scenario 'I can\'t peep a blank message' do
    visit '/'
    expect{click_button 'Peep'}.not_to change(Peep, :count)
  end

end
