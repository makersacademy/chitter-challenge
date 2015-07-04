describe Peep do

  let(:user) do
    create(:user)
  end

  let(:peep) do
    build(:peep)
  end

  it 'adds a peep to database when user posts a peep' do
    visit('/sign_in')
    sign_in(user)
    visit('/peeps/new')
    expect{ post_message(peep) }.to change(Peep, :count).by(1)
  end

end
