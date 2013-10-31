module KaExtUsers
  class IpWhitelistConstraint
    def initialize
      @ips = []
      #@ips << ::IPAddr.new('127.0.0.0')
      # you can also add blocks of IPs
      # @ips << ::IPAddr.new('192.168.0.0/16')
    end
  
    def matches?(request)
      valid = @ips.select { |cidr| cidr===request.remote_ip }
      !valid.empty?
    end
  end
end

KaExtUsers::Engine.routes.draw do
  constraint KaExtUsers::IpWhitelistConstraint.new do
    resources :users
  end
end