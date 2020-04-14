feature "making a peep" do
  scenario " should be able to make a peep after signing in from the landing page" do
    visit('/')
    expect(page).to have_button('sign up')
    click_button('sign up')
    expect(page).to have_field('username')
    fill_in('username', :with => 'testy')
    expect(page).to have_field('password')
    fill_in('password', :with => 'testy_secure')
    expect(page).to have_field('email address')
    fill_in('email address', :with => 'testy_email')
    fill_in('name', :with => 'testes')
    click_button('submit')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_field('peep text')
    fill_in('peep text', :with => 'hi every1 im new!!!!!!!
    love and waffles,
    
    t3h PeNgU1N oF d00m')
    expect(page).to have_button('Submit Peep to Chitter')
    click_button('Submit Peep to Chitter')
  end
end