require 'peeps'
require 'database_helpers'

describe Peeps do
  describe '.post' do
    it 'posts a new peep message' do
      new_peep = Peeps.post('Hello World')
      persisted_data = Peeps.last
      
      expect(new_peep).to be_a Peeps
      expect(new_peep.message).to eq 'Hello World'
      expect(new_peep.id).to eq persisted_data['id']
    end
  end

  describe '.show_peeps' do
    it 'shows all peeps' do
      peep = Peeps.post('Sad gays love money')
      Peeps.post('The beach is nice')
      Peeps.post('Stoned at the nail salon, again')
      peeps_list = Peeps.list

      expect(peeps_list.length).to eq 3
      expect(peeps_list.first.message).to eq 'Stoned at the nail salon, again'
      expect(peeps_list.last.id).to eq peep.id
    end
  end

  describe '.format_time' do
    it 'formats timestamp into "ago" format' do
      time = Time.now.strftime("%d/%m/%Y at %k:%M")
      time_ago = Time.now - 600

      expect(Peeps.format_time(time_ago)).to eq "10 minutes ago(#{time})"
    end
  end
end
