require 'peep_repository'

RSpec.describe PeepRepository do
  let(:repo) { PeepRepository.new }

  describe "#all" do
    it "returns User object by record id" do
      peeps = repo.all
      first_peep = peeps.first
      expect(first_peep.id).to eq 1
      expect(first_peep.content).to eq 'Databases are done, yay!'
      expect(first_peep.peep_time).to eq '2022-10-17 10:10:25'
      expect(first_peep.user_id).to eq 1
      expect(first_peep.reply_to_peep_id).to eq 0
    end
  end

  describe "#all_with_poster" do
    it "returns User objects with their posters" do
      peeps = repo.all_with_poster
      first_peep = peeps.first
      expect(first_peep.id).to eq 1
      expect(first_peep.content).to eq 'Databases are done, yay!'
      expect(first_peep.peep_time).to eq '2022-10-17 10:10:25'
      expect(first_peep.user_id).to eq 1
      expect(first_peep.reply_to_peep_id).to eq 0
      expect(first_peep.poster.id).to eq 1
      expect(first_peep.poster.name).to eq 'John Jr'
      expect(first_peep.poster.username).to eq 'johnj'
    end
  end

  describe "#find_with_poster(id)" do
    it "returns User object with its poster" do
      peep = repo.find_with_poster(1)
      expect(peep.id).to eq 1
      expect(peep.content).to eq 'Databases are done, yay!'
      expect(peep.peep_time).to eq '2022-10-17 10:10:25'
      expect(peep.user_id).to eq 1
      expect(peep.reply_to_peep_id).to eq 0
      expect(peep.poster.id).to eq 1
      expect(peep.poster.name).to eq 'John Jr'
      expect(peep.poster.username).to eq 'johnj'
    end
  end
end