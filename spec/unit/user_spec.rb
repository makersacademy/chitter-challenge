describe User do
    DatabaseCleaner.clean
  scenario 'create user' do
    User.create("Name", "email", "password")
    expect(User.all.count).to eq 1
  end

  scenario 'no duplicate user' do
    User.create("Name", "email", "password")
    expect(User.all.count).to eq 1
  end

  it{ expect(User.first.name).to eq "Name" }

  it{ expect(User.first.email).to eq "email" }

end
