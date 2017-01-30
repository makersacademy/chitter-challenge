require 'waiting_rspec_matchers/version'

require 'rspec/expectations'

module WaitingRspecMatchers

  class << self
    attr_accessor :default_wait_time, :default_delay

    def configure
      yield self
    end
  end

  WaitingRspecMatchers.configure do |config|
    config.default_wait_time = 2
    config.default_delay = 0.05
  end

  # @api private
  # Provides the implementation for `become_<matcher_name>`.
  # Not intended to be instantiated directly.
  class Become
    include ::RSpec::Matchers
    include ::RSpec::Matchers::Composable

    def initialize(rspec_matcher_name, where_included, *args, &expected_block)
      @rspec_matcher_name = rspec_matcher_name
      @where_included = where_included
      @args = args
      @expected_block = expected_block
      @chains = []
    end

    # @api public
    # Specifies a number of seconds that WaitingRspecMatchers should wait for a matcher to succeed
    # @param [Numeric]
    def during(max_wait_time_in_seconds)
      @max_wait_time = max_wait_time_in_seconds
      self
    end

    # @api public
    # Specifies period between tries that WaitingRspecMatchers should make when waiting for a matcher to succeed
    # @param [Numeric]
    def delay(seconds)
      @delay = seconds
      self
    end

    def method_missing(method, *args)
      @chains << [method, args]
      self
    end

    def matches?(block)
      match_helper(:to, &block)
    end

    def does_not_match?(block)
      match_helper(:not_to, &block)
    end

    def failure_message
      @failure_message
    end

    def failure_message_when_negated
      @failure_message
    end

    def supports_block_expectations?
      true
    end

    private

    def max_wait_time
      @max_wait_time || WaitingRspecMatchers.default_wait_time
    end

    def match_helper(to_or_not_to, &block)
      start_time = Time.now
      begin
        matcher = @where_included.__send__(@rspec_matcher_name.to_sym, *@args, &@expected_block)
        @chains.each do |chain|
          matcher = matcher.__send__(chain[0], *chain[1])
        end
        if matcher.respond_to?(:supports_block_expectations?) && matcher.supports_block_expectations?
          expect { block.call }.__send__(to_or_not_to, matcher)
        else
          expect(block.call).__send__(to_or_not_to, matcher)
        end
      rescue ::RSpec::Expectations::ExpectationNotMetError => e
        @failure_message = e.message
        return false if (Time.now - start_time) >= max_wait_time
        sleep @delay || WaitingRspecMatchers.default_delay
        retry
      end
      true
    end
  end

  private

  BECOME_REGEX = /^become_(.+)/

  def method_missing(method_name, *args, &expected_block)
    if m = method_name.to_s.match(BECOME_REGEX)
      rspec_matcher_name = m[1]
      unless respond_to?(rspec_matcher_name)
        raise ArgumentError, "Method `#{rspec_matcher_name}` doesn't exist. It was expected to exist and return instance of class that implements RSpec's matcher protocol."
      end
      Become.new(rspec_matcher_name, self, *args, &expected_block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, *)
    method_name.to_s =~ BECOME_REGEX || super
  end
end
