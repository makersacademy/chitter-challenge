require './lib/peeps'


describe Peeps do
  describe '#.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peeps.add(body: 'Happy Friday!')
      Peeps.add(body: 'Does chitter remind you of anything? Tweet Tweet')

      peeps = Peeps.all
      
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.body).to eq 'Happy Friday!'
      expect(peeps.first.post_time).to eq peep.post_time
    end
  end

  describe '#.add' do
    it 'adds a new peep to the peep feed' do
      new_peep = Peeps.add(body: 'new peep')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{new_peep.id};")

      expect(new_peep).to be_a Peeps
      expect(new_peep.id).to eq persisted_data.first['id']
      expect(new_peep.body).to eq 'new peep'
    end
  end
end

# write the unit test for the .add method.
# pass the tests 
# refactor code from the app into the model.