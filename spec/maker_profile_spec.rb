require 'maker_profile.rb'
require 'spec_helper'

RSpec.describe MakerProfile do
  describe '.all' do
    context 'it shows the persons profile' do
      it 'enables user to view their details after signing in' do
        MakerProfile.signup(username: "James26", name: "James", email: "James Email", password: "password")
        maker = MakerProfile.all

        expect(maker.length).to eq 1
        expect(maker.first).to be_a MakerProfile
        expect(maker.first.username).to eq "James26"
      end
    end
  end

  describe '.signup' do
    it ' creates a new user and shows new user in database' do
      maker = MakerProfile.signup(username: "Jane25", name: "Jane", email: "Janes Email", password: "password")
      PG.connect(dbname: 'chitter_test').query("SELECT * FROM profile;")
      expect(maker).to be_a MakerProfile
      expect(maker.username).to eq "Jane25"
    end
  end
end
