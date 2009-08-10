# Generates a library file and a test for it
# library goes into RAILS_ROOT/lib
# test goes into test/unit
#
# Usage:
# script/generate library library_name
#
# Will generate a class in lib/library_name
# and a test in test/unit/library_name_test
#
class RspecLibGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, class_name

      # Model, test, and fixture directories.
      m.directory File.join('lib', class_path)
      m.directory File.join('spec', class_path)

      # Model class, unit test, and fixtures.
      m.template 'library.rb',      File.join('lib', class_path, "#{file_name}.rb")
      m.template 'library_spec.rb',  File.join('spec', 'lib', class_path, "#{file_name}_spec.rb")
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} rspec_lib"
    end
end
