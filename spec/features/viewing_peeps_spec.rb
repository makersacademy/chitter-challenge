feature 'Viewing peeps' do
  scenario 'users can see peep details' do
    signup_and_peep('Chazn', 'Charlotte Fereday', 'foo@bar.com', 'Hey- am peeping')
    expect(page).to have_content('Chazn')
    expect(page).to have_content('Charlotte Fereday')
  end
  scenario 'users can see peeps in reverse chronological order on Chitter' do
    signup_and_peep('Chazn', 'Charlotte Fereday', 'foo@bar.com', 'Hey- am peeping')
    signup_and_peep('Felipe', 'Felipe Sere', 'cool@bar.com', 'Peeping away!')
    signup_and_peep('Christoph', 'Christoph Gockel', 'yeh@bar.com', 'Still peeping!')
    expect(usernames(page)).to eq ['Chazn', 'Felipe', 'Christoph']
  end
  scenario 'users can see the time the peep was made' do
    peep = Peep.new( message:      'OMG! Makers weekend challenges r so cool?!!',
                    created_at:    DateTime.new(2017, 6, 3, 18, 30, 25))
    peep.save
    visit '/peeps'
    expect(times(page)).to eq ["18:30:25"]
  end
end
