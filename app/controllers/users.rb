get '/users/new' do

  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if !@user.save
    @errors = @user.errors.full_messages
    p erb :'/users/new'
  else
    p redirect '/sessions/new'
  end
end

get '/users/:id' do
  "Hello World"
end
