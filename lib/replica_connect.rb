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
        f = File.new('rc_config.yml')
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

    def clear_env
      ['rc_username', 'rc_password', 'rc_db', 'rc_host', 'rc_adapter'].each do |ev|
        %x("unset {ev}")
      end
    end

    private

    def get_from_user(param, file)
      puts "Please enter your #{param}"
      p = gets.chomp
      f.puts "  #{param}: #{p}"
      p
    end
  end
end
