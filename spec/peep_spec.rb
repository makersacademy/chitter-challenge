require 'peep'

RSpec.describe Peep do
	let(:user) { double("Juan", name: "Juan", user_name: "jp1975")}
	content = "This is a beautiful peep"
	time = Time.now
	let(:peep) { Peep.new(user, time, content)}

	it 'has multiple attributes' do
		expect(peep.user.name).to eq('Juan')
		expect(peep.user.user_name).to eq('jp1975')
		expect(peep.content).to eq('This is a beautiful peep')
		expect(peep.time).to eq(time)
	end
end