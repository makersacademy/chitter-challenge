describe User do

  it "allows new user to be created and retreived from the database" do
    add_demo_users
    users = User.all
    p "user object test"
    p users
    expect(users[0].name).to eq('James')
    expect(users[0].password).to eq('password123')
    expect(users[1].name).to eq('Fred')
    expect(users[1].password).to eq('password321')
  end

end
