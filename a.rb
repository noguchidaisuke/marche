class Server
    attr_reader :env, :domain
end
class Config
    def server
        @server ||= Server.new
    end
end
