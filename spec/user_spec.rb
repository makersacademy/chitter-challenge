require 'user'

describe '.all' do
  it 'Returns a list of Users' do
    user = User.all

    expect(user[0].name).to eq "Helen"
    expect(user[1].user_name).to eq "LiveFastDieYoung"
    expect(user[2].email_address).to eq "rachael@gmail.com"
  end
end

# INSERT INTO userdetails(id, name, user_name, email) VALUES(3, 'Rachael', 'PrincessConsuela', 'rachael@gmail.com');
# SELECT * FROM userdetails;
