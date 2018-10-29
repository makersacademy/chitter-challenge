require 'peeps/peep'
require 'user'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
        connection = PG.connect(dbname:'chitter_test')
        connection.exec("INSERT INTO peeps (content) VALUES ('First peep here!');")
        connection.exec("INSERT INTO peeps (content) VALUES ('Second peep is also here!');")

      peeps = Peep.all

      expect(peeps).to include("First peep here!")
      expect(peeps).to include("Second peep is also here!")
    end


#     it 'displays a welcome message on sign up' do
#   user = User.new(user_params) # Wouldn't it be cool if we could do "build :user"?.*
#
#   sign_up_as(user)
#
#   expect(page).to have_content "Welcome to Chitter, #{user.email}!"
# end


#     it 'displays a welcome message on sign-in' do
#   user = User.first # assuming we have created a user in our setup. Wouldn't it be cool if we could do `create :user`? Hmmm...*
#
#   sign_in_as(user)
#
#   expect(page).to have_content "Welcome, #{user.email}!"
# end
  end
end
