require 'user'

describe User do
  # describe 'self.current' do
  #   it "shows the current user" do
  #     expect(described_class.current).to eq("admin")
  #   end
  # end

  describe 'self.change_current_user_name' do
    it "overwrites current username with argument provided" do
      described_class.change_current_user_name("Kennethy")
      expect(described_class.current_username).to eq("Kennethy")
    end
  end
  describe 'self.change_current_user_id' do
    it "overwrites current user id with argument provided" do
      described_class.change_current_user_id(342)
      expect(described_class.current_user_id).to eq(342)
    end
  end
  describe 'self.get_user_id' do
    it "returns the id of the given name" do
      pg_instance = described_class.add("Bob")
      new_id = pg_instance[0]["id"]
      expect(described_class.get_user_id("Bob")).to eq(new_id)
    end
  end
  describe 'self.get_username' do
    it "returns the name of the given id" do
      pg_instance = described_class.add("Bob")
      new_id = pg_instance[0]["id"]
      expect(described_class.get_username(new_id)).to eq("Bob")
    end
  end

  describe 'self.add' do
    it "takes a single argument" do
      expect(described_class).to respond_to(:add).with(1).argument
    end
    it "adds the user to the database" do
      pg_instance_returned = described_class.add("Bob")
      expect(pg_instance_returned[0]["username"]).to eq("Bob")
    end
  end

  # describe 'self.exists?' do
  #   it "takes a single argument" do
  #     expect(described_class).to respond_to(:exists?).with(1).argument
  #   end
  # end


end
