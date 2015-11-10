require 'peeppresenter'
require './app/models/user.rb'
require './app/models/peep.rb'

describe PeepPresenter do

def peep_user
  @peep_presenter ||= User.first(username: 'PeepPresenter')
end

  before do
    peep_presenter = User.create(username: 'PeepPresenter',
                email: 'peep@presenter.com',
                name: 'Peep Presenter',
                password: 'passwordisnotpeep',
                password_confirmation: 'passwordisnotpeep')
    test_peep = Peep.new(body: 'Peep presenter test peep')
    peep_presenter.peeps << test_peep
    peep_presenter.save
  end

  context "When passed a Peep object:" do

    it "it will unpack the user and return its first name" do
      peep = peep_user.peeps.first
      expect(described_class.run(peep)).to include ('Peep')
    end

    it "it will how long ago the peep was posted" do
      peep = peep_user.peeps.first
      expect(described_class.run(peep)).to include ('1 second ago')
    end

    it "it will retrieve the Peep body" do
      peep = peep_user.peeps.first
      expect(described_class.run(peep)).to include ('Peep presenter test peep')
    end
  end

end