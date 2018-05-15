module Knapsack::Util
  class << self
    def run_cmd(cmd)
      puts cmd if to_bool(ENV['VERBOSE'])
      system(cmd)
    end

    # Copied from coupa_development/spec/support/integration/shared_functions.rb
    def to_bool(x)
      return x if !!x == x
      return true if x =~ /^(true|t|yes|y|1)$/i
      return false if x =~ /^(false|f|no|n|0)$/i
      return false if x == ''
      !x.nil?
    end

    # On Teamcity the current working directory is:
    # teamcity_agent/work/xxxxxxx/
    # The Teamcity Ruby plugin is:
    # teamcity_agent/plugins/rake-runner/rb
    # Hence reference to the plugin from current direcoty is "../../plugins/rake-runner/rb"
    def teamcity_plugin_path
      File.expand_path("../../plugins/rake-runner/rb", Dir.pwd)
    end

    def beluga_enabled?
      # The system call returns true if the beluga 'turnip' command exists
      ENV['ENABLE_BELUGA'] == 'true' && ENV['JS_DRIVER'] == 'selenium-chrome' && system('beluga command info turnip')
    end

    def lightning_enabled?
      ENV['ENABLE_LIGHTNING'] == 'true' && ENV['JS_DRIVER'] == 'selenium-chrome'
    end
  end
end
