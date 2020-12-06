require 'sinatra'

get '/' do
  [200, {}, '投票一覧']
end