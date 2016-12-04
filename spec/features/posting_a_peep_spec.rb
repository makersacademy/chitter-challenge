require 'spec_helper.rb'
require 'web_helpers.rb'

feature 'Posting a peep' do

  scenario 'Posting a peep to Chitter' do
    sign_up
    post_a_peep
  end
end
