#!/usr/bin/env ruby
require 'twitter_ebooks'
model = Ebooks::Model.load("model/costanza.model")
puts model.make_statement(140)