module KaExtUsers
  class IpWhitelistConstraint
    def initialize
      @ips = []
      @ips << NetAddr::CIDR.create('127.0.0.0')
      # you can also add blocks of IPs
      # @ips << NetAddr::CIDR.create('192.168.0.0/16')
    end
    
    def matches?(request)
      valid = @ips.select { |cidr| cidr.contains?(request.remote_ip) }
      !valid.empty?
    end
  end
end
  