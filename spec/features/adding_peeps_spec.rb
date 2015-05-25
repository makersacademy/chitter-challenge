feature 'User adds a new peep' do
  scenario 'when browsing the homepage' do
    expect(Message.count).to eq(0)
    visit '/'
    add_peep('Hello, Chatter!', 'CurlyGirly')
    expect(Message.count).to eq(1)
    message = Message.first
    expect(message.peep).to eq('Hello, Chatter!')
    expect(message.username).to eq('CurlyGirly')
  end

  def add_peep(peep, username)
    within('#new-peep') do
      fill_in 'peep', with: peep
      fill_in 'username', with: username
      click_button 'Add Peep'
    end
  end
end
