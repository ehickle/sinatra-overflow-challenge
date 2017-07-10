get '/users/new' do

  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if !@user.save
    @errors = @user.errors.full_messages
    erb :'/users/new'
  else
    redirect '/sessions/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
