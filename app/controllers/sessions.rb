get '/sessions/new' do

  erb :'sessions/new'
end

post '/sessions' do

   @user = User.find_by(username: params[:username])
   p @user

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Username & password do not match"]
    erb :'/sessions/new'
  end
end
