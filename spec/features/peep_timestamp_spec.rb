feature 'timestamped peep' do
  scenario 'user can see the time a peep was posted' do
    sign_up
    Peep.create(:message => "what is the time?", :created_at => '2018-01-28 15:43:00 +0000', user_id: User.first.id)
    visit '/peeps'
    expect(page).to have_content '15:43'
  end
end
