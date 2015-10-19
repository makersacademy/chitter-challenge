module ChitHelpers

  def add_chit(chit)
    chit = Chit.create( time: chit.time,
                        text: chit.text,
                        user: add_user(build(:user)))
  end
end
