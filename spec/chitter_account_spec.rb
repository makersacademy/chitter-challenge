require 'chitter_account'
require 'pg'

describe ChitterAccount do
  # subject(:account) { ChitterAccount.new('Olatunji', 'ola123', 'olatunji@gmail.com', '12345') }  
  
  # describe '.sign_up' do
  #   it 'store users username' do  
  #     expect(account).to be_an_instance_of(ChitterAccount)
  #   end

  #   it 'returns username' do
  #     expect(account.username).to eq 'ola123'
  #   end
  # end

   describe '.sign_up' do
    it 'creates user account' do 
      user_account = ChitterAccount.sign_up('Olatunji', 'ola123', 'olatunji@gmail.com', '12345')
      expect(user_account).to be_an_instance_of(ChitterAccount)
    end
  end
end