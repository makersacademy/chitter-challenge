require 'chitter'
require 'rspec'

describe 'it returns all chitters' do
   it 'should return all the chitter peeps' do
    chitters = Chitter.all
    expect(chitters).to include("Test Chitter Message")
    expect(chitters).to include("Another test chitter")
    expect(chitters).to include("yet another test chitter")
  end
end

# describe 'it returns chitters in the correct order' do
#   it 'should return chitters in reverse order' do
#     chitters = Chitter.all
#     expect(chitters).to
#   end
# end
