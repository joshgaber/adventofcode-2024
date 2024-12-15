module Day2
  class Report
    def initialize(input)
      @report =
        case input
        when String
          input.strip.split(/\s+/).map(&:to_i)
        when Array
          input
        else
          raise ArgumentError, 'Invalid type for input'
        end
    end

    def within_threshold?
      differences.all? { (1..3).cover?(_1) } ||
        differences.all? { (-3..-1).cover?(_1) }
    end

    def without(index)
      self.class.new(@report.dup.tap { |report| report.delete_at(index) })
    end

    def respond_to_missing?(method_name)
      @report.respond_to?(method_name) || super
    end

    def method_missing(method_name, ...)
      return @report.__send__(method_name, ...) if @report.respond_to?(method_name)

      super
    end

    private

    def differences
      @differences ||= (0...(length - 1)).map { self[_1 + 1] - self[_1] }
    end
  end
end