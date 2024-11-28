# frozen_string_literal: true

# Controller class to manage the calculations for the calculator app
#
# This controller handles the logic for performing calculations
# based on user input. It supports operations such as addition,
# subtraction, multiplication, and division.
class CalculationsController < ApplicationController
  # Renders the form for the user to input calculation data.
  #
  # @return [void]
  def new
    @result = nil
  end

  # Processes the calculation based on user input.
  #
  # This action receives the input values and the selected operation
  # from the user, performs the calculation, and renders the result.
  #
  # @example
  #   POST /calculate
  #   Parameters: {"a"=>"5", "b"=>"3", "operation"=>"add"}
  #   Response: Result of the addition operation
  #
  # @return [void]
  def calculate
    a = params[:a].to_f
    b = params[:b].to_f
    operation = params[:operation]

    @result = calculate_result(a, b, operation)

    respond_to do |format|
      format.html { render :new }
      format.turbo_stream { render :create }
    end
  end

  private

  # Performs the calculation based on the given values and operation
  #
  # @param value1 [Float] the first value
  # @param value2 [Float] the second value
  # @param operation [String, Symbol, nil] the operation to perform
  # @return [String, Float] the result of the calculation
  def calculate_result(value1, value2, operation)
    calculator = Calculator.new
    return 'Operation parameter is missing' if operation.nil?

    operation = operation.to_sym
    return 'Unknown operation' unless calculator.respond_to?(operation)

    calculator.send(operation, value1, value2)
  end
end
