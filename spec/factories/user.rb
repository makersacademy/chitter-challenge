FactoryGirl.define do

# FactoryGirl will assume that the parent model of a factory
# named ":user" is "User"
  factory :user do
    email                 'roy@reynholm.co.uk'
    password              'isecretlylovejen'
  end

end