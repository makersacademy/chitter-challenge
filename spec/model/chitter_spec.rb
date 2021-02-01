require './lib/chitter'
require 'database_helpers'

describe Chitter do 

    describe '.post_peep' do     
         it 'should create' do 
            user = User.create(email: "ddot@ddot.com", password: "password123", name: "ddot", username: "ddott")
            integer = user.userid
            peep = Chitter.post_peep(peep: 'This is my first peep', userid: integer)
            persisted_data = persisted_data(peep.id)
            expect(peep).to be_a Chitter
            expect(peep.id).to eq persisted_data['id']
            expect(peep.peep).to eq 'This is my first peep'
        end
    end 

    describe '.timeline' do 
        it 'should show all peeps' do 
            user1 = User.create(email: "ddot@ddot.com", password: "password123", name: "ddot", username: "ddott")
            user2 = User.create(email: "dd@dd.com", password: "password123", name: "dant", username: "dant")
            integer1 = user1.userid
            integer2 = user2.userid
            Chitter.post_peep(peep: 'This is my first peep', userid: integer1)
            Chitter.post_peep(peep: 'This is my second peep', userid: integer2)

            chitters = Chitter.timeline 

            expect(chitters.first.peep).to include('This is my first peep')
            expect(chitters.last.peep).to include('This is my second peep')
        end
    end

end