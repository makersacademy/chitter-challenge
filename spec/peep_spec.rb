require 'peep'
require 'user'
require 'database_helper'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      #time = time.strftime("%Y-%m-%d %H:%M:%S")
      peep = Peep.create(message: 'First peep!', created_at: Time.now)
      Peep.create(message: 'Welcome', created_at: Time.now)

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'First peep!'
      #expect(peeps.first.message).to eq 'Second peep is also here!'
      #expect(peeps.first.created_at).to eq "{#{created_at}}"
    end

    describe '.create' do
      it 'creates new peep' do
        peep = Peep.create(message: 'First peep goes here', created_at: Time.now)
        persisted_data = persisted_data(table: 'peeps', id: peep.id)

        expect(peep).to be_a Peep
        expect(peep.id).to eq persisted_data.first['id']
        expect(peep.message).to eq 'First peep goes here'
      end
    end

    #   peep = Peep.create(message: 'First peep here!', peep_created_at: Time.now)
    #   Peep.create(message: 'Second peep is also here!', peep_created_at: Time.now)
    #
    #
    #   peeps = Peep.all
    #
    #   expect(peeps.length).to eq 2
    #   expect(peeps.first).to be_a Peep
    #   expect(peeps.first.id).to eq peep.id
    #   expect(peeps.first.message).to eq 'First peep here!'
    #   expect(peeps.first.created_at).to eq Time.now
    #
    # end


#     it 'displays a welcome message on sign up' do
#   user = User.new(user_params) # Wouldn't it be cool if we could do "build :user"?.*
#
#   sign_up_as(user)
#
#   expect(page).to have_message "Welcome to Chitter, #{user.email}!"
# end


#     it 'displays a welcome message on sign-in' do
#   user = User.first # assuming we have created a user in our setup. Wouldn't it be cool if we could do `create :user`? Hmmm...*
#
#   sign_in_as(user)
#
#   expect(page).to have_message "Welcome, #{user.email}!"
# end
  end
end
