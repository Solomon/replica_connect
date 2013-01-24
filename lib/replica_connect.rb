require "replica_connect/version"
require 'sequel'

module ReplicaConnect
  class Connection

    def initialize(username=nil, password=nil)
      @username = username || get_username_from_user
      @password = password || get_password_from_user
    end


    def list
      puts "#{@username} and #{@password}"
    end

    private

    def get_username_from_user
      puts "Please enter your username:"
      gets.chomp
    end

    def get_password_from_user
      puts "Please enter your password:"
      gets.chomp
    end

  end
  
end
