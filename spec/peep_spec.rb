require_relative 'web_helpers'

describe Peep do

  describe "#create" do

    it 'Must have a body on creation' do
      new_peep = Peep.create
      expect(new_peep.save).to eq false
      expect(new_peep.errors.map { |error| error }).to include ["Body must not be blank"]
    end

    it 'Has a character limit of 130' do
      new_peep = Peep.create body: long_peep
      expect(new_peep.save).to eq false
      expect(new_peep.errors.map { |error| error }).to include ["Body must be between 0 and 130 characters long"]
    end

  end

  # describe "#body" do
  #
  #   it 'Returns a list of the contents of each peep, in descending order' do
  #     Peep.create body: "Test peep!"
  #     Peep.create body: "Test peep number two!"
  #     first_peep = Peep.body[0]
  #     expect(first_peep).to eq "Test peep number two!"
  #   end
  #
  # end

  describe "#date_and_time" do

    it 'Returns a correctly formatted string' do
      new_peep = Peep.create body: "Time test peep"
      expect(new_peep.date_and_time).to match /\d{1,2}\/\d{1,2}\/\d{4}\s\s\s\d{1,2}\:\d{1,2}\.\d{1,2}/
    end

  end







end
