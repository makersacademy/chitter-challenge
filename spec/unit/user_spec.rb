describe User do

  scenario 'create user' do
    User.create("Name", "handle", "email", "password", "egg.png")
    expect(User.all.count).to eq 1
  end

  scenario 'no duplicate user' do
    User.create("Name", "handle", "email", "password", "egg.png")
    expect(User.all.count).to eq 1
  end

  scenario 'add second user' do
    User.create("Other Name", "handles", "other email", "password", "egg.png")
    expect(User.all.count).to eq 2
  end

  it { expect(User.first.name).to eq "Name" }

  it { expect(User.first.email).to eq "email" }

  it { expect(User.first.handle).to eq "handle" }

  it { expect(User.first.avatar).to eq "egg.png" }

end
