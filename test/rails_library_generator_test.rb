require File.dirname(__FILE__) + '/test_helper'
require 'generators/generator_test_helper'

class RailsLibraryGeneratorTest < GeneratorTestCase

  def test_library_generates_resources
    run_generator('library', %w(password_generator))

    assert_generated_library_for :password_generator
    assert_generated_unit_test_for :password_generator, "Test::Unit::TestCase"
  end

  def test_library_generates_resources_by_camelcase
    run_generator('library', %w(PasswordGenerator))

    assert_generated_library_for "PasswordGenerator"
    assert_generated_unit_test_for "PasswordGenerator", "Test::Unit::TestCase"
  end

end
