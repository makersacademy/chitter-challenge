require 'account'
require 'database_helpers'

describe Account do

  it 'creates a new account' do
    account = Account.create(forename: 'Lucy', surname: 'Stringer', username: 'stringiest', email: 'lucyjstringer@gmail.com', password: 'password123')
    persisted_data_account = persisted_data_account(account_id: account.account_id)

    expect(account).to be_a Account
    expect(account.account_id).to eq persisted_data_account['account_id']
    expect(account.username).to eq 'stringiest'

  end
end
