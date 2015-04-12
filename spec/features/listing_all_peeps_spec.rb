# require 'spec_helper'

# feature 'User browses the list of peeps' do

#   before(:each) do
#     User.create(id: 1,
#                 email: 'phoebe@phoebeh.com',
#                 username: 'phoebe')
#     Peep.create(text: 'This is my first Peep',
#                 user_id: 1)           
#   end

#   scenario 'when opening the home page' do
#     visit '/'
#     expect(page).to have_content("This is my first Peep")
#   end

# end


# # <!-- <div id="new-peep">
# #   <form action="/peeps" method="post">
# #     Name: <input type="text" name="name" placeholder="Full name"><br>
# #     Email: <input type="email" name="email" placeholder="Email"><br>
# #     Password: <input type="password" name="password" placeholder="Password"><br>
# #     <input type="submit" value="Sign up for Chitter">
# #   </form>
# # </div>
