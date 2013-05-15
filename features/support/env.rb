require 'cappie'

Cappie.start(
  command: './node_modules/.bin/pogo ./src/server.pogo',
  await: /Server running/,
  host: 'http://127.0.0.1:3000'
)