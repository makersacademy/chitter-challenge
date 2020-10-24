require './lib/peeps'
<<<<<<< HEAD
require 'database_helper'

describe Peeps do
  describe '#.all' do
    
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      Peeps.add(body: 'Happy Friday!')
      Peeps.add(body: 'Does chitter remind you of anything? Tweet Tweet')
      newest_peep = Peeps.add(body: 'testing newest tweet')

      p peeps = Peeps.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq newest_peep.id
      expect(peeps.first.body).to eq 'testing newest tweet'
      expect(peeps.first.post_time).to eq newest_peep.post_time
=======


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
>>>>>>> dab571213c8f9abdec2809f7e4d02f6c10cfe18e
    end
  end

  describe '#.add' do
    it 'adds a new peep to the peep feed' do
      new_peep = Peeps.add(body: 'new peep')
<<<<<<< HEAD
      persisted_data = persisted_data(id: new_peep.id)

      expect(new_peep).to be_a Peeps
      expect(new_peep.id).to eq persisted_data['id']
=======
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{new_peep.id};")

      expect(new_peep).to be_a Peeps
      expect(new_peep.id).to eq persisted_data.first['id']
>>>>>>> dab571213c8f9abdec2809f7e4d02f6c10cfe18e
      expect(new_peep.body).to eq 'new peep'
    end
  end
end
<<<<<<< HEAD
=======

# write the unit test for the .add method.
# pass the tests 
# refactor code from the app into the model.
>>>>>>> dab571213c8f9abdec2809f7e4d02f6c10cfe18e
