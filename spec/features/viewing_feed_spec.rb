feature 'Chitter feed' do
  scenario 'peeps include name and username' do
    peep = Peep.create(user_id: 3, content: 'Yarp!')
    visit '/'

    expect(first('.peep')).to have_content 'Dana Gajewska'
    expect(first('.peep')).to have_content '@danusia.x'
  end

  scenario 'peeps to include the time the peep was posted' do
    peeps = ChitterFeed.all
    visit '/'

    expect(first('.peep')).to have_content peeps.first.timestamp
  end
end
