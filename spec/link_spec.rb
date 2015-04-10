describe Link do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the db' do
      expect(Link.count). to eq(0)

      Link.create(peep: 'blah blah blah', user: 'paulwallis42')

      expect(Link.count). to eq(1)

      link = Link.first

      expect(link.peep).to eq('blah blah blah')
      expect(link.user).to eq('paulwallis42')

      link.destroy

      expect(Link.count).to eq(0)
    end
  end
end
