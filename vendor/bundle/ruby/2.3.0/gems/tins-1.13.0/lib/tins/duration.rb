module Tins
  class Duration
    def initialize(seconds)
      @days, @hours, @minutes, @seconds, @fractional_seconds =
        [ 86_400, 3600, 60, 1, 0 ].inject([ [], seconds ]) {|(r, s), d|
          if d > 0
            dd, rest = s.divmod(d)
            r << dd
            [ r, rest ]
          else
            r << s
          end
        }
    end

    def days?
      @days > 0
    end

    def hours?
      @hours > 0
    end

    def minutes?
      @minutes > 0
    end

    def seconds?
      @seconds > 0
    end

    def fractional_seconds?
      @fractional_seconds > 0
    end

    def format(template = '%d+%h:%m:%s.%f', precision: nil)
      result = template.gsub(/%[dhms]/,
        '%d' => @days,
        '%h' => '%02u' % @hours,
        '%m' => '%02u' % @minutes,
        '%s' => '%02u' % @seconds,
      )
      if result.include?('%f')
        if precision
          fractional_seconds = "%.#{precision}f" % @fractional_seconds
        else
          fractional_seconds = '%f' % @fractional_seconds
        end
        result.gsub!('%f', fractional_seconds[2..-1])
      end
      result
    end

    def to_s
      template  = '%h:%m:%s'
      precision = nil
      if days?
        template.prepend '%d+'
      end
      if fractional_seconds?
        template << '.%f'
        precision = 3
      end
      format template, precision: precision
    end
  end
end
