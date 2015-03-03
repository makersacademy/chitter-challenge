feature "viewing peeps" do
require_relative './helpers/sign_up.rb'
require_relative './helpers/add_peep.rb'

  scenario "no login required to view all peeps" do
    sign_up
    add_peep "this is a short peep"
    add_peep "another short peep"
    click_button 'Sign out'
    visit '/peeps'
    expect(page).to have_css('.peep', :count => 2)
  end
end

