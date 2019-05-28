describe Account do

  it 'can make an account with handle' do
    Account.add('me')
    expect(Account.all.first.handle).to eq('me')
  end

end
