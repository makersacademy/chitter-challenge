feature 'timestamped peep' do
  scenario 'user can see the time a peep was posted' do
    Peep.create(:message => "what is the time?", :created_at => '2018-01-28 15:43:00 +0000')
    visit '/peeps'
    expect(page).to have_content '15:43'
  end
end
