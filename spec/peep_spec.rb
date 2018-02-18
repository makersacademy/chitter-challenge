require 'peep'

describe Peep do
  context '#all' do
    it 'returns all the peeps' do
      peeps = Peep.all
      peep = peeps.map(&:peep)
      expect(peep).to include('Hi Chitter World!')
      expect(peep).to include('I really hate how ASDA stores its fruit')
      expect(peep).to include('Did you know that human livers can regrow?')
    end
  end
  context '.add_new_peep' do
    it 'add new peep to the list of peeps' do
      Peep.add_new_peep('Anyone else out on the lash tonight?', '@JamesTheMan')
      peeps = Peep.all
      peep = peeps.map(&:peep)
      expect(peep).to include('Anyone else out on the lash tonight?')
    end
  end
end

  # context '.delete(id)' do
  #   it 'deletes the row that the id corresponds to' do
  #     Link.delete(1)
  #     links = Link.all
  #     urls = links.map(&:url)
  #     expect(urls).not_to include("http://www.makersacademy.com")
  #   end
  # end
  # context '.update(id, url)' do
  #   it 'updates the URL with a new one entered in' do
  #     Link.update(1, "http://www.reddit.com")
  #     links = Link.all
  #     urls = links.map(&:url)
  #     expect(urls).not_to include("http://www.makersacademy.com")
  #     expect(urls).to include("http://www.reddit.com")
  #   end
  # end
