require 'logger'

class RequestLogger

  def initialize(app, filename = STDERR)
    @app = app
    @logger = Logger.new(filename)
    @logger.formatter = proc { |severity, datetime, progname, msg|
      "#{datetime}: #{msg}\n"
    }
  end

  def call(env)
    print_request env

    @app.call(env)
  end


  def log(str)
    @logger.info str
  end

  def print_request(env)
    log "==== BEGIN REQUEST #{ env['PATH_INFO'] } ===="

    env.each do |k, v|
      begin
        log "#{k}: #{v.inspect[0..150]}"
      rescue => e
        log "#{k}: ERROR INSPECTING(#{e.inspect}) #{v.class}: #{v.to_s[0..100]}"
      end
    end

    log "== DATA =="
    log env['rack.input'].read
    log "==== END REQUEST ===="

    log nil
  end
end