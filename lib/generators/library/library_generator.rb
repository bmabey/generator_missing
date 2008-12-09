class LibraryGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, class_name, "#{class_name}Test"

      # Model, test, and fixture directories.
      m.directory File.join('lib', class_path)
      m.directory File.join('test/unit', class_path)

      # Model class, unit test, and fixtures.
      m.template 'library.rb',      File.join('lib', class_path, "#{file_name}.rb")
      m.template 'unit_test.rb',  File.join('test/unit', class_path, "#{file_name}_test.rb")
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} Library"
    end
end
