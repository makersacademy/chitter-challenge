describe User do
  # subject(:user){described_class.new(email: 'test@examp.le', password: 'secret')}

  context 'defaults' do
    it 'has a password_confirmation argument to validate password' do
      user_count = described_class.count
      obj_wrong = described_class.new(
        email: 'test@examp.le',
        password: 'secret',
        password_confirmation: 'maybenotsecret',
        username: 'jonodoe',
        name: 'John Doe')
      obj_wrong.save
      expect(described_class.count).to eq(user_count)

      obj = described_class.new(
        email: 'test@examp.le',
        password: 'secret',
        password_confirmation: 'secret',
        username: 'jonodoe',
        name: 'John Doe')
      obj.save
      expect(described_class.count).to eq(user_count + 1)
    end

    it 'only accepts valid email addresses' do
      obj_wrong = described_class.new(
        email: '',
        password: 'secret',
        password_confirmation: 'secret',
        username: 'jonodoe',
        name: 'John Doe')
      obj_wrong.save
      expect(obj_wrong.errors[:email]).to eq(["We need your email address."])

      obj_wrong = described_class.new(
        email: 'asda/sa/d-sad.-/asd-/asd.sa.#a][p]',
        password: 'secret',
        password_confirmation: 'secret',
        username: 'jonodoe',
        name: 'John Doe')
      obj_wrong.save
      expect(obj_wrong.errors[:email]).to eq(["Doesn't look like an email address to me ..."])

      obj = described_class.new(
          email: 'test@examp.le',
          password: 'secret',
          password_confirmation: 'secret',
          username: 'jonodoe',
          name: 'John Doe')
      expect(obj.save).to eq(true)
    end

    it 'cannot register 2 times the same email address' do
      obj1 = described_class.new(
          email: 'test@examp.le',
          password: 'secret',
          password_confirmation: 'secret',
          username: 'jonodoe',
          name: 'John Doe')
      expect(obj1.save).to eq(true)
      obj2 = described_class.new(
          email: 'test@examp.le',
          password: 'secret',
          password_confirmation: 'secret',
          username: 'jonodoe',
          name: 'John Doe')
        obj2.save
        expect(obj2.errors[:email]).to eq(["We already have that email."])
    end

    it 'cannot register 2 times the same username' do
      obj1 = described_class.new(
          email: 'test@examp.le',
          password: 'secret',
          password_confirmation: 'secret',
          username: 'jonodoe',
          name: 'John Doe')
      expect(obj1.save).to eq(true)
      obj2 = described_class.new(
          email: 'test1@examp.le',
          password: 'secret',
          password_confirmation: 'secret',
          username: 'jonodoe',
          name: 'John Doe')
        obj2.save
        expect(obj2.errors[:username]).to eq(["We already have that username."])
    end
  end
end
