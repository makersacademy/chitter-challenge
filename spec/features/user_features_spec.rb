require './app.rb'
require 'spec_helper'
require 'pg'

# feature 'peeps are displayed in reverse chronological order' do
#   scenario 'the first peep returned is the most recently added' do
#     connection = PG.connect :dbname => 'chitter_test'
#     visit '/'
#     fill_in 'enter_chitter', with: "Hello chitter world"
#     click_on 'Chit'
#     visit '/'
#     fill_in 'enter_chitter', with: "This should be first"
#     click_on 'Chit'
#     visit '/peeps'
#     expect("This should be first").to appear_before("Hello chitter world")
#   end
# end

# May need to reqrite the above test as appear_before doesn't seem to be working. The test may need to be in an HTML list
