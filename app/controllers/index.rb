get '/' do
  redirect '/questions'
end

get '/form' do
  erb :form
end
