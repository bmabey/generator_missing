# Creates a new Generator extending Rails::Generator::Base
#
class BaseGeneratorGenerator < Rails::Generator::Base
  attr_accessor :generator_name, :generator_class

  def initialize(*runtime_args)
    super(*runtime_args)
    @generator_name = runtime_args[0].to_s
    @generator_class = @generator_name.classify
    @generator_filename = "#{@generator_name}_generator.rb"
  end

  def manifest
    record do |m|
      m.directory "lib/generators/#{@generator_name}"
      m.directory "lib/generators/#{@generator_name}/templates"

      # templates
      m.template 'generator.erb',"lib/generators/#{@generator_name}/#{@generator_filename}"
      m.template 'usage.erb',"lib/generators/#{@generator_name}/USAGE"
      m.template 'readme.erb',"lib/generators/#{@generator_name}/templates/readme.erb"
    end
  end
end
