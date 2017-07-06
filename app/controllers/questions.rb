get '/questions' do
  @questions = Question.order(:id).all

  erb :'/questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  # redirect '/' unless current_user
  @author = current_user

  @author.questions.create(params[:question])
  # @question = Question.create(params[:question])
  # @author = User.find(1)
  redirect '/'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

delete '/questions/:id/' do
  Question.find(params[:id]).destroy!
  redirect '/'
end
