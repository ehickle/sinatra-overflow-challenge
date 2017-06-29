get '/users/new' do




  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.password != params[:confirm_password]
    @errors = ["Passwords don't match."]
    erb :'/users/new'
  end

  if @user.save
    redirect '/sessions/new'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end

end
