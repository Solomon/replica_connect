# ReplicaConnect

This gem will allow you to easily create a connection to a database in
order to run scripts from any ruby file.

## Installation

Add this line to your application's Gemfile:

    gem 'replica_connect'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install replica_connect

## Usage

To use the gem, include it in your ruby file as follows:

`require 'replica_connect'`

Then, create a connection with

`c = ReplicaConnect::Connection.new().connect`

And run SQL queries with

`c.execute('SELECT * FROM users LIMIT 1')`

The first time you run a script with replica_connect, it will prompt you
for database connection information.

replica_connect then creates a `rc_config.yml` file in the directory of your
script that contains the database connection information, so after you
input it once, you can change your script and run it multiple times
without re-inputting the connection data.

If you are checking your script into source control, make sure to add
the `rc_config.yml` file to your `.gitignore`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
