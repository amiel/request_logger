class RequestLogger

  def initialize(filename)
    @f = File.open(filename, 'w+')
  end

  def call(env)
    print_request env
    [200, { 'Content-Type' => 'text/plain' }, [' ']]
  end


  def log(str)
    str = "[#{ Time.now.to_s }] #{ str }"
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

    log "==== END REQUEST ===="

  end
end