describe "Cheat class all method" do 
  # using test DB here 
  it "returns list of 'cheets' stored in test DB" do
    set_table 
    cheet = Cheet.new
    expect(cheet.all).to eq [["The world is flat", Time.now.strftime("%d/%m/%Y"), Time.now.strftime("%k:%M")], ["Hello flat world", Time.now.strftime("%d/%m/%Y"), Time.now.strftime("%k:%M")]]
  end 
end 
