require 'peep'

describe Peep do
  describe 'Contains the data for a peep' do
    it "has an id, message, user_id and date it was created" do
      peep = Peep.new(id:'1', message: 'My first peep!',user_id: '1', created_at: "#{Time.now}")
      expect(peep).to respond_to(:id)
    end
  end
end