feature 'Add peeps' do

  scenario 'Page loads and form visible' do
    visit '/peep/new'
    expect(page).to have_content 'Add peep'
    expect(page).to have_field 'post'
    expect(page).to have_button 'Post your peep'
  end

  context 'Adding a peep' do

    let(:user_details) {[
      { :email => 'bob@testing.com', :user_name => 'bob', :password => 'password' },
      { :email => 'fred@testing.com', :user_name => 'fred', :password => 'password' }
    ]}

    before do
      add_test_users_directly(user_details)
      full_log_in_journey(user_details[0][:user_name], user_details[0][:password])
      visit '/peep/new'
    end

    scenario 'Can add a peep' do
      fill_in 'post', with: 'A random peep'
      click_button 'Post your peep'
      expect(page).to have_content 'A random peep'
    end
  end
end
