feature 'posting a peep' do
  scenario "writes in form and clicks Peep and see's the Peep" do
    visit '/'
    fill_in :new_peep, with: 'first ever Peep on Chitter'
    click_button 'Peep!'
    expect(page).to have_content 'first ever Peep on Chitter'
  end
end
