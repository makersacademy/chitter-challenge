require_relative './spec_helper'
require_relative '../models/user-peeps'

describe 'user-peeps' do

  it 'creates a new user-peep entry' do
    generate_example_users
    generate_example_peeps
    generate_example_threads
    p user_peep = UserPeep.add(user_id:1, peep_id:1, thread_id:1)
    expect(user_peep['user_id']).to eq '1'
    expect(user_peep['peep_id']).to eq '1'
  end

end