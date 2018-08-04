feature 'Testing Infrastructure works' do

    scenario 'works on main page' do
      visit '/'
      expect(page).to have_content "Testing Infrastructure Works!"
  end

end
