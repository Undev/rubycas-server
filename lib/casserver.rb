module CASServer; end

require 'active_record'
require 'active_support'
require 'sinatra/base'
require 'builder'
require 'logger'
$LOG = Logger.new(STDOUT)

require 'casserver/server'
module Tilt
  class BuilderTemplate < Tilt::Template
    def evaluate(scope, locals, &block)
      # Changing indent to 0 to adjust generated xml to play well with OmniAuth CAS strategy. That's tested with Tilt 1.1 only.
      xml = ::Builder::XmlMarkup.new(:indent => 0)
      if data.respond_to?(:to_str)
        locals[:xml] = xml
        super(scope, locals, &block)
      elsif data.kind_of?(Proc)
        data.call(xml)
      end
      xml.target!
    end
  end
end
