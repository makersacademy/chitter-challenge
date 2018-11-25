describe Peep do

  let(:user_info) { { 'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'} }

  it 'can create peep' do
    created_user = User.create(user_info)
    result = Peep.create(description: 'This is my first peep', id: created_user.id)
    expect(result[0]['description']).to eq('This is my first peep')
  end

  context 'result in reverse chronological order' do
    it 'can list all peeps' do
      created_user = User.create(user_info)
      peep = Peep.create(description: 'This is my first peep',id: created_user.id)
      Peep.create(description: 'The second peep',id: created_user.id)
      Peep.create(description: 'The third peep',id: created_user.id)

      result = Peep.all(id: created_user.id)
      expect(result[0].description).to eq('The third peep')
    end
  end

end
