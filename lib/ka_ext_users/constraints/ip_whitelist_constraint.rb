#require 'ipaddr'

module KaExtUsers
  class IpWhitelistConstraint
    #def initialize
      #@ips = []
      # @ips << ::IPAddr.new('127.0.0.0')
      # you can also add blocks of IPs
      # @ips << NetAddr::CIDR.create('192.168.0.0/16')
      #end
    
    def matches?(request)
      #valid = @ips.select { |cidr| :cidr===request.remote_ip }
      #!valid.empty?
      false
    end
  end
end
  