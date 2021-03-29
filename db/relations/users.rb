class Users < ROM::Relation[:sql]
  schema(infer: true) do
    associations do
      has_many :peeps
    end
  end
  def user_with_peeps
    users.combine(:peeps)
  end
end
