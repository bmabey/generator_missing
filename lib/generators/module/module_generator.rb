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
class ModuleGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, class_name, "#{class_name}Test"

      # Model, test, and fixture directories.
      m.directory File.join('lib', class_path)
      m.directory File.join('test/unit', class_path)

      # Model class, unit test, and fixtures.
      m.template 'module.rb',      File.join('lib', class_path, "#{file_name}.rb")
      m.template 'unit_test.rb',  File.join('test/unit', class_path, "#{file_name}_test.rb")
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} Module"
    end
end
