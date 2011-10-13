# Standalone app.
module App

  def self.call(env)
    [200, { 'Content-Type' => 'text/plain' }, [' ']]
  end

end
