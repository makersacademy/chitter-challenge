describe User do

  scenario 'create user' do
    User.create("Name", "email", "password")
    expect(User.all.count).to eq 1
  end

end
