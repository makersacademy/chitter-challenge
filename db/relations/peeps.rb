class Peeps < ROM::Relation[:sql]
  schema(infer: true)

  def all_reverse_chrono
    select(:id, :user_id, :content, :created_at).order(:created_at).to_a.reverse
  end
end
