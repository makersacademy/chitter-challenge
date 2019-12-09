RSpec.feature 'Chitter Feeds' do
  before(:each) do
    someone_else_signs_up_and_signs_in
    fill_in 'new-peep', with: 'I love truffles'
    click_on 'Send Peep'
    click_on 'Log Out'

    sign_up_and_sign_in
    fill_in 'new-peep', with: 'I hate truffles'
    click_on 'Send Peep'
  end
  
  scenario 'user wants to see all the peeps sent on the platform' do
    expect(page).to have_content 'Jimmy456'
    expect(page).to have_content 'I love truffles'
    expect(page).to have_content 'Sam123'
    expect(page).to have_content 'I hate truffles'
  end

  scenario 'user only wants to see their own tweets, I mean peeps..' do
    click_on 'My Profile'
    
    expect(page).not_to have_content 'Jimmy456'
    expect(page).not_to have_content 'I love truffles'
    expect(page).to have_content 'Sam123'
    expect(page).to have_content 'I hate truffles'
  end
end
