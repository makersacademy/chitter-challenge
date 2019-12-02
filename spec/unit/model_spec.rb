# Unit tests for the classes in the model (lib)

require 'peep'

describe Peep do

  context ': check_user' do
    it 'checks the user is in the database' do
      expect(subject.is_user?("test@test.com")).to eq true
      expect(subject.is_user?("bob@test.com")).to eq false
    end
  end

  context '- user creates a peep' do
    it '- method responds to correct # of arguments' do
      expect(subject).to respond_to(:create).with(2).arguments
    end

    # it 'checks the user is in the database' do
    #
    # end
    #
    # it 'can store the peep in the database with time and date' do
    #
    # end
    #
    # it 'rejects a peep which is too long' do
    #
    # end

  end

end
