describe Peeps do 

  context 'Checking that datamapper works' do 
    it 'should be created and then retrieved from the db' do 
      expect(Peeps.count).to eq(0)
      Peeps.create(message: 'my first peep!')
      expect(Peeps.count).to eq(1)
      peep = Peeps.first
      expect(peep.message).to eq('my first peep!')
      peep.destroy
      expect(Peeps.count).to eq(0)
    end
  end
end