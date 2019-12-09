RSpec.feature 'log in' do
  before(:each) do
    sign_up_and_sign_in
  end
  
  scenario 'user logs into their account' do
    click_on 'My Profile'

    expect(page).to have_content 'Sam123\'s Peeps'
  end

  scenario 'user logs out' do
    click_on 'Log Out'
    
    expect(page).not_to have_content 'Send Peep'
  end
end
