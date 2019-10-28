feature 'creating message' do
    scenario 'should create a message and store it on the database' do
        visit('/')
        connection = PG.connect(dbname: "chitter_challenge")

        Messages.create(message: 'Hi')

        msg = Messages.list
        
        expect(msg).to include("Hi")
    end
end