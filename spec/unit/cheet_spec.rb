
describe "Cheets list" do 
  # using test DB here 
  it "returns list of 'cheets' stored in DB" do
    set_table 
    cheet = Cheet.new
    expect(cheet.all).to eq "The world is flat"
  end 
end 