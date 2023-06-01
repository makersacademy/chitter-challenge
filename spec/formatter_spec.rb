require 'display'

RSpec.describe Display do
  before(:each) do
    reset_tables
  end

  it 'formats a peep into a nice post' do
    peep = double(
      :peep,
      content: 'First post',
      time: '12:00:00',
      user_id: 1,
      name: 'Louis',
      username: 'lpc',
      tags: []
    )
    display = Display.new
    result = display.peep(peep)

    expected_result = "
    Louis (<a href='users/1'>lpc</a>) says:<br/>
    First post<br/>
    - 12:00:00
    <br/>
    "

    expect(result).to eq expected_result
  end

  it 'formats a user into a display of their details' do
    user = double(
      :user,
      email: 'lou@chitter.com',
      name: 'Louis',
      username: 'lpc'
    )
    display = Display.new
    result = display.user(user)
    expected_result = "
    <h2>lpc</h2>
    <div>Louis, lou@chitter.com</div>
    <br/>
    "
    
    expect(result).to eq(expected_result)
  end
end
