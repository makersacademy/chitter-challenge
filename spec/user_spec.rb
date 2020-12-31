require 'user'

describe User do
  # describe 'self.current' do
  #   it "shows the current user" do
  #     expect(described_class.current).to eq("admin")
  #   end
  # end

  describe 'self.change' do
    it "overwrites current user with argument provided" do
      described_class.change("Kennethy")
      expect(described_class.current).to eq("Kennethy")
    end
  end

end
