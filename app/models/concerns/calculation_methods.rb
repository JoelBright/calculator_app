# frozen_string_literal: true

# app/models/concerns/calculation_methods.rb
module CalculationMethods
  extend ActiveSupport::Concern

  included do
    operations = %i[add subtract multiply divide]

    operations.each do |operation|
      define_method(operation) do |a, b|
        raise ArgumentError, 'Arguments cannot be nil' if a.nil? || b.nil?

        opperation_select(a, b, operation)
      end
    end

    def opperation_select(val1, val2, operation)
      case operation
      when :add
        val1 + val2
      when :subtract
        val1 - val2
      when :multiply
        val1 * val2
      when :divide
        val1 / val2
      end
    end
  end
end
