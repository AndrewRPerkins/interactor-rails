module Interactor
  class Generator < ::Rails::Generators::NamedBase
    class_option :test_type, type: :string, default: 'spec', aliases: '-t',
                             desc: 'Should the generated tests be spec or test'

    def self.source_root
      File.expand_path('../templates', __FILE__)
    end

    def generate
      template "#{self.class.generator_name}.erb", File.join('app/interactors', class_path, "#{file_name}.rb")
      if %w[spec test].include?(options.test_type)
        template "#{options.test_type}.erb", File.join("#{options.test_type}/interactors", class_path, "#{file_name}_#{options.test_type}.rb")
      end
    end
  end
end
