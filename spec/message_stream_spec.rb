describe Messagestream do 
  let!(:stream) do
    Messagestream.create message: "Test string"
  end
  
  it "Stores messages" do
    expect(stream.all).to include "Test string"
  end
end