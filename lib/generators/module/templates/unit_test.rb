require 'test_helper'

class <%= class_name %>Mock
  include <%= class_name %>
end

class <%= class_name %>Test < Test::Unit::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
