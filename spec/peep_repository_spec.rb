require 'peep_repository'

RSpec.describe PeepRepository do
  before(:each) do
    reset_tables
  end

  describe '#all' do
    it 'returns all peeps' do
      peep_repository = PeepRepository.new
      expect(peep_repository.all.first.content).to eq 'Jar Jar Noises'
      expect(peep_repository.all.first.user_id).to eq '1'
      expect(peep_repository.all.first.creation_date).to eq '2022-10-07 00:00:00'
      expect(peep_repository.all[1].content).to eq 'Millions will be starvin and dyin without your help.'
      expect(peep_repository.all[10].content).to eq 'JESSE! HEY JESSE.. WE NEED TO COOK!'
    end
  end

  describe '#find' do
    it'returns a peep' do
      peep_repository = PeepRepository.new
      peep1 = peep_repository.find('1')
      expect(peep1.content).to eq 'Jar Jar Noises'
      peep2 = peep_repository.find('8')
      expect(peep2.content).to eq 'Hello there'
      expect(peep2.user_id).to eq '3'
    end
  end

  describe '#create' do
    it 'creates a new peep' do
      peep = Peep.new('Say my name', DateTime.now, 4)
      peep_repository = PeepRepository.new
      peep_repository.create(peep)
      expect(peep_repository.all.last.content).to eq 'Say my name'
      peep2 = Peep.new('My name is JarJar', DateTime.now, 1)
      peep_repository.create(peep2)
      expect(peep_repository.all.last.content).to eq 'My name is JarJar'
    end
  end
end