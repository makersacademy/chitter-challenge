require 'spec_helper'

FactoryGirl.define do

  factory :user do # FactoryGirl will assume that the parent model of a factory named ":user" is "User".
    email 'foo@bar.com'
    password 'secret1234'
    username 'WaveyDavey'
  end
end