describe User do
  it 'returns all users' do
    drop_test_database
    populate_test_database
    r = User.all
    expect(r[0].name).to eq('Volker')
    expect(r[0].email).to eq('volker@volker.com')
    expect(r[1].name).to eq('Volker2')
    expect(r[2].name).to eq('Volker3')
  end
  it 'finds the right user name' do
    drop_test_database
    populate_test_database
    expect(User.find_username(2)).to eq('Volker2')
  end
  it 'creates a new user' do
    drop_test_database
    populate_test_database
    test_user = User.create('test_user', 'test_email')
    expect(test_user.name).to eq('test_user')
    expect(test_user.email).to eq('test_email')
    r = DBcon.query("SELECT * from users WHERE id = 4;")
    expect(r.values[0][0].to_i).to eq(4)
    expect(r.values[0][1]).to eq('test_user')
    expect(r.values[0][2]).to eq('test_email')
  end
end
