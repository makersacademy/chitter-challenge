describe " " do 
  it "Stores email passed into Database" do 
    set_table2
    email = Email.new
    expect(email.all).to eq("myemail@gmail.com")
  end
end 
