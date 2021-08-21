describe "Cheets sheet list" do 
  # using test DB here 
  it "returns list of 'cheets' stored in DB" do
    cheet = Cheet.new 
    expect(cheet.all).to eq "The world is flat"
  end 
end 