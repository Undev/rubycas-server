module CASServer; end

require 'active_record'
require 'active_support'
require 'sinatra/base'
require 'builder'
require 'logger'
$LOG = Logger.new(STDOUT)

require 'casserver/server'
