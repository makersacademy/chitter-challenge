feature 'Tagging' do

  scenario 'users can tag other users in their peeps' do
    signup(email: 'jimbob@hotmail.com', username: 'JimBob')
    signup
    send_peep('Hey Jim @JimBob')
    expect(Tag.count).to eq 1
  end

end
