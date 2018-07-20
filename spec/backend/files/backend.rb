#!/usr/bin/env ruby
require 'webrick'
require 'json'
require 'mime/types'

URI_ATTRS = %w(
  scheme
  userinfo
  host
  port
  registry
  path
  opaque
  query
  fragment
)

server = WEBrick::HTTPServer.new(Port: 80)
trap(:INT){ server.shutdown }

server.mount_proc('/') do |req, res|
  uri = req.request_uri

  res.body = req['x-test-body'] || JSON.pretty_generate({
    request_method: req.request_method,
    uri: URI_ATTRS.map {|k| [k, uri.send(k)] }.to_h,
    header: req.header,
    body: req.body,
  })

  res.keep_alive = false

  mime_type = MIME::Types.type_for(uri.path).first
  res.content_type = mime_type.to_s if mime_type

  x_test_status = req['x-test-status']
  res.status = x_test_status.to_i if x_test_status
end

server.start
