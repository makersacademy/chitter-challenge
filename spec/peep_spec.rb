require './lib/peep.rb'
require 'setup_test_database.rb'
require 'spec_helper'

describe Peep do

  describe '.all' do 
    it 'returns all the peeps' do
      DatabaseConnection.query("INSERT INTO peeps (content, name) VALUES('1st test', 'tester1');")
      peeps = Peep.all
      expect(peeps.first).to be_a Peep
      expect(peeps.length).to eq 1
      expect(peeps.first.content).to eq '1st test'
      expect(peeps.first.name).to eq 'tester1'
    end 

    it 'returns peeps in reverse chronological order' do 
      DatabaseConnection.query("INSERT INTO peeps (content, name) VALUES ('1st test', 'tester1');")
      DatabaseConnection.query("INSERT INTO peeps (content, name) VALUES ('2nd test', 'tester2');")
      DatabaseConnection.query("INSERT INTO peeps (content, name) VALUES ('3rd test', 'tester3');")
      peeps = Peep.all
      expect(peeps.first).to be_a Peep
      expect(peeps.length).to eq 3
      expect(peeps.first.content).to eq '3rd test'
      expect(peeps.first.name).to eq 'tester3'
    end 
  end

  describe '.post' do 
    it 'adds a peep to the database' do
      peep = Peep.post(content: 'Testing peep', name: 'Test Peeper')
      expect(peep).to be_a Peep
      expect(peep.content).to eq 'Testing peep'
      expect(peep.name).to eq 'Test Peeper'
    end 
  end 
end 
