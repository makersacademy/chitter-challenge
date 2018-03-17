require 'peep'

describe 'Peep' do

  describe '.channel' do

    context 'should create an array of Peep instances' do
      it 'should return an array with peeps table data' do
        expect(Peep.channel[0]).to be_an_instance_of(Peep)
      end
    end

    context 'Peep instance should have id' do
      it 'peep id should be captured' do
        expect(Peep.channel[0].id).to eq '1'
      end
    end

    context 'Peep instance should have time' do
      it 'peep current time should be captured' do
        expect(Peep.channel[1].time).to eq '2018-03-17 13:45:44'
      end
    end

    context 'Peep instance should have name' do
      it 'peep name should be captured' do
        expect(Peep.channel[0].name).to eq 'Daniel Campos'
      end
    end

    context 'Peep instance should have username' do
      it 'peep username should be captured' do
        expect(Peep.channel[1].username).to eq '@bhavy'
      end
    end

    context 'Peep instance should have peep(msg)' do
      it 'peep msg should be captured' do
        expect(Peep.channel[0].peep).to eq 'My first peep!'
      end
    end
  end

  describe '.new_peep' do
    context 'User adds new peep to the channel' do
      it 'should add a new peep to the channel' do
        name = "test"
        username = "@username"
        peep = "Testing 1-2"
        time = "noon"
        expect(ChitterConnection).to receive(:query).with("INSERT INTO peeps(time, name, username, peep) VALUES('#{time}', '#{name}', '#{username}', '#{peep}')")
        Peep.new_peep(name, username, peep, time)
      end
    end
  end
end
