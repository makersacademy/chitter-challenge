require "status"

describe Status do

  describe ".all" do
    it "should displays a list of statuses and authors" do
      Status.create(status: 'makers made me!!', author: "mrsmaker")
      Status.create(status: 'I will destroy all the software', author: "destroyer")

      status = Status.all

      expect(status[0]).to include("makers made me!!")
      expect(status[0]).to include("mrsmaker")
      expect(status[1]).to include('I will destroy all the software')
      expect(status[1]).to include('destroyer')
    end
  end

  describe ".create" do
    it "should display the yeehaw when 'yeehaw' is passed as a status" do
      Status.create(status: 'yeehaw', author: 'enthusiastcowboy')
      expect(Status.all[0]).to include("yeehaw")
    end
  end

end
