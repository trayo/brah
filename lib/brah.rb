require "brah/version"

module Brah

  def self.run(git_remote_output)
    Brah.new(git_remote_output).run
  end

  class Brah
    attr_reader :command

    def initialize(git_remote_output)
      raise("No remotes found!") if git_remote_output.empty?
      parsed_command = convert_ssh_to_http(git_remote_output)
      @command = "open #{parsed_command}"
    end

    def run
      system(command)
    end

    private

      def convert_ssh_to_http(git_remote_output)
        git_remote_output.match(/origin\t(.+)\.git/)[1].gsub("com:", "com/").gsub("git@", "https://")
      end
  end
end
