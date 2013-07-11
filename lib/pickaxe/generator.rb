require 'thor/group'
require 'active_support/inflector'

module Pickaxe
  class Generator < Thor::Group
    include Thor::Actions

    argument :gem_name

    def self.source_root
      File.expand_path(File.dirname(__FILE__) +'/templates')
    end

    def run_bundle
      run "bundle gem #{gem_name}", :verbose => false
    end

    def setup_project
      remove_file "#{gem_name}/Rakefile"
      remove_file "#{gem_name}/Gemfile"
      
      directory "test"

      template 'test_helper.tt',  "#{gem_name}/test/test_helper.rb"
      template 'Guardfile.tt',    "#{gem_name}/Guardfile"
      template 'Gemfile.tt',      "#{gem_name}/Gemfile"
      template 'Rakefile.tt',     "#{gem_name}/Rakefile"

      inside gem_name do
        create_file "test/#{gem_name}_test.rb" do
          <<-EOS
require 'test_helper'

describe #{gem_name.classify} do
  subject { #{gem_name.classify} }

end
EOS
        end

        append_to_file "test/test_helper.rb" do
          "require '#{gem_name}'"
        end
      end
      
      bundle

      commit "Initial gem creation with testing!"
    end

  private

    def commit(msg)
      inside gem_name do 
        run "git add ."
        run "git commit -m '#{msg}'"
      end
    end

    def bundle
      inside gem_name do 
        run "bundle install"
      end
    end

  end
end
