require 'thor/group'

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

      template 'test_helper.tt',  "#{gem_name}/tests/test_helper.rb"
      template 'Guardfile.tt',    "#{gem_name}/Guardfile"
      template 'Gemfile.tt',      "#{gem_name}/Gemfile"
      template 'Rakefile.tt',     "#{gem_name}/Rakefile"
      
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
