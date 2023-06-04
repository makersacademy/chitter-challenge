class Mentions
  def find(peep)
    /@\S*/ =~ peep.content
    if $~
      return $~.to_s.sub(/@/, '')
    else
      return nil
    end
  end
end
