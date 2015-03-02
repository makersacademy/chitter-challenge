module Hobbit

  module Mote

    def params
      @params ||= create_proper_hash(request.params)
    end

    # This is from Sinatra. I'm not exactly sure what is happening,
    # but it allows symbols to be passed as keys even though
    # all the keys are strings.

    def create_proper_hash(pre_hash)
      params_hash = symbol_indifferent_hash
      pre_hash.each { |key, value| params_hash[key] = value }
      params_hash
    end

    def symbol_indifferent_hash
      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
    end

    def default_layout
      "#{layouts_path}/layout.mote"
    end

    def layouts_path
      "#{views_path}"
    end

    def views_path
      'app/views'
    end

  end
end
