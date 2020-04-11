feature "making a peep" do
  scenario " should be able to make a peep from the landing page" do
    visit('/')
    expect(page).to have_button('New Peep')
    click_button('New Peep')
    expect(page).to have_current_path('/peeps/new')
    expect(page).to have_field('peep text')
    fill_in('peep text', :with => 'hi every1 im new!!!!!!!
    love and waffles,
    
    t3h PeNgU1N oF d00m')
    expect(page).to have_button('Submit Peep to Chitter')
    click_button('Submit Peep to Chitter')
  end
end