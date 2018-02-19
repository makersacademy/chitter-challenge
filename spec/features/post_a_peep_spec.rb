feature 'posting a peep' do

  scenario "chitter user leaves her/his name with peep" do
    visit '/'
    fill_in :new_peep, with: 'first ever Peep'
    fill_in :name, with: 'Chitterlotte'
    click_button 'Peep!'
    expect(page).to have_content 'first ever Peep'
    expect(page).to have_content 'Chitterlotte'
  end
end
