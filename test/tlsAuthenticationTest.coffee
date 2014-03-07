should = require "should"
sinon = require "sinon"
tlsAuthentication = require "../lib/tlsAuthentication"

describe "Setup mutual TLS", ->
	it "should add all trusted certificates and enable mutual auth from all applications to server options if mutual auth is enabled", ->
		options = tlsAuthentication.getServerOptions(true)
		options.ca.should.be.ok
		options.requestCert.should.be.true
		options.rejectUnauthorized.should.be.false
	it "should NOT have mutual auth options set if mutual auth is disabled", ->
		options = tlsAuthentication.getServerOptions(false)
		options.should.not.have.property "ca"
		options.should.not.have.property "requestCert"
		options.should.not.have.property "rejectUnauthorized"
	it "should add the servers key and certificate to the server options", ->
		options = tlsAuthentication.getServerOptions(false)
		options.cert.should.be.ok
		options.key.should.be.ok