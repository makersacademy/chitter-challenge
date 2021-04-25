# frozen_string_literal: true

require 'spec_helper'

describe User do
  it 'It Responds to #User.create' do
    expect(User).to respond_to(:create)
  end
end
