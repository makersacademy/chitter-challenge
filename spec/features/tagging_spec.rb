feature 'Tagging' do

  scenario 'users can tag other users in their peeps' do
    signup(email: 'jimbob@hotmail.com', username: 'JimBob')
    signup
    send_peep('Hey Jim @JimBob')
    expect(Tag.count).to eq 1
  end

  scenario 'multiple users can be tagged in each peep' do
    signup(email: 'jeff@hotmail.com', username: 'Jeff')
    signup(email: 'jimbob@hotmail.com', username: 'JimBob')
    signup
    send_peep('Hey guys @JimBob @Jeff')
    expect(Tag.count).to eq 2
  end

end
