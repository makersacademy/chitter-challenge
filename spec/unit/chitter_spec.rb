require './lib/chitter'

describe Chitter do
  describe '.peep_post' do
    it 'should able to post' do
      chitter = Chitter.peep_post(peep: 'First peep', user_id: 1)
      chitter.each do |row|
        expect(row['peep']).to eq 'First peep'
      end
    end
  end

  describe '.peep_all' do
    it 'should list all peeps' do
      Chitter.peep_post(peep: 'First peep', user_id: 1)
      Chitter.peep_post(peep: 'Second peep', user_id: 1)
      Chitter.peep_post(peep: 'Third peep', user_id: 1)

      peeps = Chitter.peep_all

      peeps.each do |row|
        expect(row['created_on']).to eq Time.now.strftime('%H:%M')
      end
    end
  end

  describe '.peep_delete' do
    it 'should delete pepe' do
      peep = Chitter.peep_post(peep: 'First peep', user_id: 1)
      
      peep.each do |peep_find|
        Chitter.peep_delete(id: peep_find['id'])
        peeps = Chitter.peep_all
        peeps.each do |peep_foo| 
          expect(peep_foo['peep']).not_to include 'First peep'
        end
      end
    end
  end

  describe '.peep_sort' do
    it 'should sort peeps' do
      Chitter.peep_post(peep: 'First peep', user_id: 1)
      Chitter.peep_post(peep: 'Second peep', user_id: 1)
      peep_sort = Chitter.peep_sort

      peeps = []
      peep_sort.each do |sort|
        peeps << sort['peep']
      end
      expect(peeps[0]).to eq 'Second peep'
    end
  end

end
