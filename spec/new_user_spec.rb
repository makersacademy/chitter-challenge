describe Users do
  it 'lets you sign up and saves your details' do
    Users.sign_up(username: "charliecodes",
                  firstname: "Charlie",
                  secondname: "Fischer",
                  email: "charlie@makersacademy.com",
                  password: "password")
    expect(Users.all_members.last.username).to eq "charliecodes"
  end
end
