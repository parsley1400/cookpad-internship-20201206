require 'sinatra'
require_relative 'lib/poll'
require_relative 'lib/vote'

get '/' do
  '投票一覧'
  polls = [
    Poll.new('好きな料理', ['肉じゃが', '生姜焼き', '唐揚げ'], '20201220'),
    Poll.new('人気投票', ['おむすびけん', 'クックパッドたん'], '20201220')
  ]

  erb :index, locals:{ polls: polls }
end