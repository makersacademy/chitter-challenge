feature "Showing peep usernames" do
  let!(:second_user) do
    User.create(username: 'theiry',
                email: 'theiry@gmail.com',
                password:  '4321',
                password_confirmation: '4321')
              end

  scenario "A peep can have a single username" do
    share_peep
    expect(page).to have_content 'Hello my chitter peoples'
    expect(page).to have_content 'Peeped by: @mrmurtz'
  end

  scenario "The peeps page displays peeps from different users" do
  share_peep
  click_button 'Log out'
  log_in(email: 'theiry@gmail.com',
        password: '4321')
  click_button 'Share a peep'
  fill_in('peep', :with => "Bonjour, what a day to win the league")
  click_button 'Peep'
  expect(page).to have_content 'Bonjour, what a day to win the league'
  expect(page).to have_content 'Peeped by: @theiry'
  end
end
