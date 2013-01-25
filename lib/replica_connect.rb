require "replica_connect/version"
require 'active_record'

module ReplicaConnect
  class Connection

    def initialize
      if File.exists?('rc_config.yml')
        file = YAML.load_file('rc_config.yml')
        configs = file['rc']
        @username = configs['username']
        @password = configs['password']
        @db_name = configs['db']
        @host = configs['host']
        @adapter = configs['adapter']
      else
        f = File.new('rc_config.yml', 'w+')
        f.puts "rc:"
        @username =  get_from_user('username',f)
        @password =  get_from_user('password',f)
        @db_name  =  get_from_user('db',f)
        @host     =  get_from_user('host',f)
        @adapter  =  get_from_user('adapter',f)
        f.close
      end
    end

    def connect
      ActiveRecord::Base.establish_connection(
        :adapter => @adapter,
        :host => @host,
        :database => @db_name,
        :username => @username,
        :password => @password).connection
    end

    def clear_config
      File.delete('rc_config.yml') unless !File.exists?('rc_config.yml')
    end

    private

    def get_from_user(param, file)
      puts "Please enter your #{param}"
      p = gets.chomp
      file.puts "  #{param}: #{p}"
      p
    end
  end
end
