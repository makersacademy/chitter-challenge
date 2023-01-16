require 'account_repository'


RSpec.describe AccountRepository do

    def reset_accounts_table
        seed_sql = File.read('spec/seeds/seeds_accounts.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_network_test' })
        connection.exec(seed_sql)
    end
    
    before(:each) do 
        reset_accounts_table
    end

    it "returns full list of accounts" do
        repo = AccountRepository.new
        accounts = repo.all

        expect(accounts.length).to eq(3)

        expect(accounts[0].id).to eq(1)
        expect(accounts[0].email).to eq('johnsmith@makers.com')
        expect(accounts[0].username).to eq('jsmith98')
        expect(accounts[0].password).to eq('abc123!!')
        expect(accounts[0].name).to eq('John Smith')

        expect(accounts[1].id).to eq(2)
        expect(accounts[1].email).to eq('benking@makers.com')
        expect(accounts[1].username).to eq('bking98')
        expect(accounts[1].password).to eq('def456??')
        expect(accounts[1].name).to eq('Ben King')

        expect(accounts[2].id).to eq(3)
        expect(accounts[2].email).to eq('chrisbacon@makers.com')
        expect(accounts[2].username).to eq('cbacon98')
        expect(accounts[2].password).to eq('ghi789!!')
        expect(accounts[2].name).to eq('Chris Bacon')
    end

    context "it finds a single account" do
        it "returns John's account" do
            repo = AccountRepository.new
            account = repo.find(1)

            expect(account.id).to eq(1)
            expect(account.email).to eq('johnsmith@makers.com')
            expect(account.username).to eq('jsmith98')
            expect(account.password).to eq('abc123!!')
            expect(account.name).to eq('John Smith')
        end

        it "returns Ben's account" do
            repo = AccountRepository.new
            account = repo.find(2)

            expect(account.id).to eq(2)
            expect(account.email).to eq('benking@makers.com')
            expect(account.username).to eq('bking98')
            expect(account.password).to eq('def456??')
            expect(account.name).to eq('Ben King')
        end

        it "returns Chris' account" do
            repo = AccountRepository.new
            account = repo.find(3)

        expect(account.id).to eq(3)
        expect(account.email).to eq('chrisbacon@makers.com')
        expect(account.username).to eq('cbacon98')
        expect(account.password).to eq('ghi789!!')
        expect(account.name).to eq('Chris Bacon')
        end
    end

    it "creates a new Account object" do
        repo = AccountRepository.new

        new_account = Account.new
        new_account.email = 'lukeshaw@makers.com'
        new_account.username =  'lshaw98'
        new_account.password = 'jkl123??'
        new_account.name = 'Luke Shaw'
        
        repo.create(new_account)

        expect(repo.all).to include(
            have_attributes(
                email: 'lukeshaw@makers.com',
                username: 'lshaw98',
                password: 'jkl123??',
                name: 'Luke Shaw'
            )
        )
    end
end