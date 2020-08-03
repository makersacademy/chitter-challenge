require_relative './spec_helper'
require_relative '../models/thread'

describe 'thread'  do

  it 'adds a new thread' do
    expect(ParentThread.add.id).to eq '1'
    expect(ParentThread.add.id).to eq '2'
  end


end
