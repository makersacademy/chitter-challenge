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
end
