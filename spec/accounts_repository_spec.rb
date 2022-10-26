# file: spec/accounts_repository_spec.rb

require "spec_helper"
require_relative '../lib/accounts_repository'

describe AccountsRepository do

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
    it "finds a user by ID" do

        ac_re = AccountsRepository.new
        res = ac_re.find(1)
        expect(res.username).to eq("sjmog")

    end
    it "creates a user" do

        ac_re = AccountsRepository.new
        ac_id = ac_re.create({
            email: "bobsmith@example.com",
            password: "securepassword321",
            name:"Bob Smith",
            username:"bobsm"
        })
        expect(ac_re.find(ac_id).username).to eq("bobsm")

    end
    it "does not create a user due to the email already being registered" do

        ac_re = AccountsRepository.new
        ac_qu = ac_re.create({
            email: "samm@makersacademy.com",
            password: "password321",
            name:"Sam Morgan",
            username:"sjmog"
        })
        expect(ac_qu).to eq(false)

    end
    it "authenticates a user" do

        ac_re = AccountsRepository.new
        auth_st = ac_re.authenticate(
            "samm@makersacademy.com",
            "password123"
        )
        expect(auth_st).to eq("1")

    end
    it "does not authenticate a user due to incorrect password" do

        ac_re = AccountsRepository.new
        auth_st = ac_re.authenticate(
            "samm@makersacademy.com",
            "password321"
        )
        expect(auth_st).to eq(false)

    end

end