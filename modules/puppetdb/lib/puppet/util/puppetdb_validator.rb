require 'puppet/network/http_pool'

module Puppet
  module Util
    class PuppetdbValidator
      attr_reader :puppetdb_server
      attr_reader :puppetdb_port

      def initialize(puppetdb_server, puppetdb_port)
        @puppetdb_server = puppetdb_server
        @puppetdb_port = puppetdb_port
      end

      # Utility method; attempts to make an https connection to the puppetdb server.
      # This is abstracted out into a method so that it can be called multiple times
      # for retry attempts.
      #
      # @return true if the connection is successful, false otherwise.
      def attempt_connection
        # All that we care about is that we are able to connect successfully via
        # https, so here we're simpling hitting a somewhat arbitrary low-impact URL
        # on the puppetdb server.
        path = "/metrics/mbean/java.lang:type=Memory"
        headers = {"Accept" => "application/json"}
        conn = Puppet::Network::HttpPool.http_instance(@puppetdb_server, @puppetdb_port, true)
        response = conn.get(path, headers)
        unless response.kind_of?(Net::HTTPSuccess)
          Puppet.notice "Unable to connect to puppetdb server (#{@puppetdb_server}:#{@puppetdb_port}): [#{response.code}] #{response.msg}"
          return false
        end
        return true
      rescue Exception => e
        Puppet.notice "Unable to connect to puppetdb server (#{@puppetdb_server}:#{@puppetdb_port}): #{e.message}"
        return false
      end
    end
  end
end

