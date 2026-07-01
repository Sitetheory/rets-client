### jshint node:true ###
### jshint -W097 ###
'use strict'

sax = require('sax')


class Parser
  constructor: (parserEncoding = 'UTF-8') ->
    parser = sax.createStream(true,
      trim: false
      normalize: false
      lowercase: false
      xmlns: false
    )

    parser.on 'opentag', (node) ->
      parser.emit('startElement', node.name, node.attributes || {})

    parser.on 'closetag', (name) ->
      parser.emit('endElement', name)

    # Preserve the old node-expat style API used by callers.
    parser.parserEncoding = parserEncoding
    return parser


module.exports =
  Parser: Parser
