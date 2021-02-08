require 'peep'
require 'database_helpers'

describe Peep do

  describe ".all" do
    it "shows a list of all peeps" do
      user = User.create(user_name: 'katy', email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep_content: "I am peeping for the first time!", peep_user_id: user.user_id)
      Peep.create(peep_content: "I am peeping for the first time, too!", peep_user_id: user.user_id)
      Peep.create(peep_content: "Well, I am peeping for the second time!", peep_user_id: user.user_id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
     # expect(peeps.first.id).to eq peeps.id
      expect(peeps.first.peep_content).to eq "Well, I am peeping for the second time!"
    end
  end

  describe ".create" do
    it "creates a new peep" do
      user = User.create(user_name: 'katy', email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep_content: 'This is a test peep!', peep_user_id: user.user_id)
      # persisted_data = persisted_data(table: :peeps, peep_id: peep.peep_id)


      expect(peep).to be_a Peep
      # expect(peep.peep_id).to eq persisted_data['peep_id']
      expect(peep.peep_content).to include "This is a test peep!"
    end
  end



end