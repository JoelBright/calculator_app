# frozen_string_literal: true

require 'test_helper'

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get calculate' do
    get calculations_calculate_url
    assert_response :success
  end
end
