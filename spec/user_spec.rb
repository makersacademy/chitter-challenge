require 'spec_helper'

describe User do

   context 'Understand how datamapper works' do

    it 'should be created and then retrieved from the db' do

      expect(User.count).to eq 0
      User.create(name: "Paul", username: "Pauly", email: "paulfitz99@gmail.com")
      expect(User.count).to eq 1
      user = User.first
      expect(user.name).to eq "Paul"
      user.destroy
      expect(User.count).to eq 0

    end
   end

end