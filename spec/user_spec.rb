require 'user'

describe 'self.current' do
  it "shows default user as 'admin'" do
    expect(described_class.current).to eq("admin")
  end
end

describe 'self.change' do
  it "can overwrites current user with argument provided" do
    described_class.change("Kennethy")
    expect(described_class.current).to eq("Kennethy")
  end
end
