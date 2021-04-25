require 'peep'

describe Peep do
  describe '.all' do
    it 'shows all the peeps from database' do
      DatabaseConnection.query("INSERT INTO peeps(text) VALUES('my first peep')")
      peep = Peep.all[0].text
      expect(peep).to eq('my first peep')
    end

    context 'shows the peeps in reverse order' do
      it '.reverse' do
        DatabaseConnection.query("INSERT INTO peeps(text) VALUES('my first peep')")
        DatabaseConnection.query("INSERT INTO peeps(text) VALUES('my second peep')")
        peeps = Peep.all
        expect(peeps[0].text).to eq('my second peep')
      end
    end

    it 'have time stamps' do
      post_time = Time.new.strftime("%k:%M on %d/%m/%Y") 
      DatabaseConnection.query("INSERT INTO peeps(text,time_stamp) VALUES('my first peep','#{post_time}')")
      time = Peep.all[0].time
      expect(time).to eq(post_time)
    end
  end

  describe '.create' do
    it 'stores a peep in database' do
      Peep.create(text: 'my first peep')
      text = Peep.all[0].text
      expect(text).to eq('my first peep')
    end
  end
end
