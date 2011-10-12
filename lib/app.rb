module App

  def self.call(env)
    case env['PATH_INFO']
    when '/crossdomain.xml'
      crossdomain
    else
      [200, { 'Content-Type' => 'text/plain' }, [' ']]
    end
  end

  def self.crossdomain
    xml = <<-XML.gsub(/^ {6}/, '')
      <?xml version="1.0"?>
      <!DOCTYPE cross-domain-policy SYSTEM
      "http://www.macromedia.com/xml/dtds/cross-domain-policy.dtd">
      <cross-domain-policy>
        <allow-access-from domain="*" secure="false" />
      </cross-domain-policy>
    XML

    [200, { 'Content-Type' => 'text/xml' }, xml.lines]
  end

end
