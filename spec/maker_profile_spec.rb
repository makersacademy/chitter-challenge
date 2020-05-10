require 'maker_profile.rb'
require 'spec_helper'


RSpec.describe MakerProfile do
  describe '.all' do
    context 'it shows the persons profile' do
      it 'enables user to view the latest person to sign up after they completed the steps' do
        # maker = MakerProfile.signup(username: "Sally25", name: "Sally", email: "Sally Email", password: "password")
        maker = MakerProfile.signup(username: "James26", name: "James", email: "James Email", password: "password")
        expect(MakerProfile.all).to have_content "James"
       end
      end
    end
  end
