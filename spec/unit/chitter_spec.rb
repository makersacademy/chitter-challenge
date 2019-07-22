require 'Message'
require 'database_helpers'
require 'timecop'


  describe Message do
    describe '.post' do
      it 'posts a messsage to the Message database' do

          peep = Message.post(message: 'Hello, world')
          persisted_data = persisted_data(id: peep.id)

          expect(peep).to be_a Message
          expect(peep.id).to eq persisted_data.first['id']
          expect(peep.peep).to eq 'Hello, world'
      end
    end


    describe '.all' do
      it 'Shows all the Message added to the database' do
        Timecop.freeze(Time.parse("1:30pm, 28th November 2019")) do

          first_message = Message.post(message: 'Hello, world')
          Message.post(message: 'What a goal!')
          Message.post(message: 'Come on you reds')

          peeps = Message.all

          expect(peeps.length).to eq 3
          expect(peeps.first).to be_a Message
          # expect(peeps.first.id).to eq first_message.id
          # expect(peeps.first.message).to eq 'Hello, world'

        end
      end

      it 'Shows the time a peep was made' do
        Timecop.freeze(Time.parse("1:30pm, 28th November 2019")) do
          Message.post(message: 'What a goal!')

          peep = Message.all

          expect(peep.first.time).to eq "28 Nov 2019 13:30:00PM"
        end
      end
    end
  end
