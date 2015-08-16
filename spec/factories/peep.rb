FactoryGirl.define do
  factory(:peep) do
    content('Coding is fun')
    time("#{Time.new}")
  end
end