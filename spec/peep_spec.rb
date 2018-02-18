require 'link'

describe Peep do
  context '#all' do
    it 'returns all the peeps' do
      peeps = Peep.all
      peep = peeps.map(&:peep)
      expect(peep).to include("Hi Chitter World!")
      expect(peep).to include("I really hate how ASDA stores its fruit")
      expect(peep).to include("Did you know that human livers can regrow?")
    end
  end
  context '.add_new_link' do
    it 'add new link to the end of bookmark list' do
      Link.add_new_link('http://www.testlink.com')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include('http://www.testlink.com')
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
