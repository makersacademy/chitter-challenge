def create_user_and_peep
  user = User.create(name: "Mara", email: "mara@gmail.com", 
      password: "password", handle: "marawanot")
    Peep.create(handle: user.handle, text: "Sunday Funday", 
      created_at: Time.utc(2016,"May",1,20,15,1))
    visit ('/')
    expect(page.status_code).to eq 200
end