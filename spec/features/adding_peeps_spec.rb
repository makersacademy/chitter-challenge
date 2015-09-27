feature 'Adding peeps:' do

  scenario 'I can add a peep' do
    peep = build :peep
    visit '/'
    fill_in :message, with: peep.message
    click_button 'Peep'
    within 'div#peeps' do
      expect(page).to have_content(peep.message)
    end
  end

  scenario 'I can\'t peep a blank message' do
    visit '/'
    expect{click_button 'Peep'}.not_to change(Peep, :count)
  end

end
