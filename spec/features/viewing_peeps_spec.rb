feature 'Viewing peeps' do
  scenario 'users can see peeps in reverse chronological order on Chitter' do
    sign_up('@codey_mc_code_face')
    login('@codey_mc_code_face')
    sign_up('@heya')
    login('@heya')
    sign_up('@boaty_mc_boat_face')
    login('@boaty_mc_boat_face')
    usernames(['@codey_mc_code_face', '@heya', '@boaty_mc_boat_face'])
    expect(usernames(page)).to eq ['@boaty_mc_boat_face', '@heya', '@codey_mc_code_face']
  end
  scenario 'users can see the time the peep was made' do
    peep = Peep.new( message:      'OMG! Makers weekend challenges r so cool?!!',
                    created_at:    DateTime.new(2017, 6, 3, 18, 30, 25))
    peep.save
    visit '/peeps'
    expect(times(page)).to eq ["18:30:25"]
  end
end
