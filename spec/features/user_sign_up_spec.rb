require './app/chitter.rb'
require 'spec_helper'
require_relative 'web_helpers'

feature 'User signup' do
  scenario 'User can sign up for Chitter' do
    expect { signup }.to change { User.count }.by(1)
  end
end
