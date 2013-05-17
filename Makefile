mocha :
	mocha test/*_spec.pogo test/models/*_spec.pogo

server :
	pogo src/server.pogo

cuke :
	bundle exec cucumber

test : mocha

spec : mocha