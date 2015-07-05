describe Peep do

  let(:peep) do
    build(:peep)
  end

  let(:user) do
    create(:user)
  end

  let(:comment) do
    build(:comment)
  end

  it 'adds a comment to database when user posts a comment on a peep' do
    visit('/sign_in')
    sign_in(user)
    visit('/peeps/new')
    post_message(peep)

    expect{ post_reply(comment) }.to change(Comment, :count).by(1)
  end
end
