require 'peeps'

describe Peeps do
  
   describe '.all' do
     it 'returns all peeps/messages' do
       timeline = Peeps.all

       expect(timeline).to include("Tired")
       expect(timeline).to include("Hungry")
       expect(timeline).to include ("lonely")
       end
     end
   end
