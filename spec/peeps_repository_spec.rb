# file: spec/peeps_repository_spec.rb

require "spec_helper"
require_relative '../lib/peeps_repository'

describe PeepsRepository do

    # ensure DB is reset for each test
    def reset_reposes
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
        connection.exec(seed_sql)
    end
    before(:each) do
        reset_reposes
    end

    # method tests
    it "returns all peeps" do

        pe_re = PeepsRepository.new
        res = pe_re.all()
        expect(res[0].message).to eq("My first peep!")

    end
    it "finds a peep" do

        pe_re = PeepsRepository.new
        expect(pe_re.find(1).message).to eq("My first peep!")

    end
    it "creates a peep" do

        pe_re = PeepsRepository.new
        pe_id = pe_re.create(
            "A new peep",
            "2"
        )
        expect(pe_re.find(pe_id).message).to eq("A new peep")

    end

end