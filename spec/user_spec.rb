describe Users do
  it 'lets you sign up' do
    Users.sign_up(username: "dude", firstname: "Someone", secondname: "Something", email: "Karsten@makersacademy.com")
    expect(Users.all_members[0].username).to eq "dude"
  end
end