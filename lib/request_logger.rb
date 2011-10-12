class RequestLogger

  def initialize(app, filename)
    @app = app
    @f = File.open(filename, File::WRONLY | File::CREAT | File::APPEND)
  end

  def call(env)
    print_request env
    @app.call(env)
  end


  def log(str)
    str = "[#{ Time.now.to_s }] #{ str }" unless str.nil?
    @f.puts str
    @f.flush
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