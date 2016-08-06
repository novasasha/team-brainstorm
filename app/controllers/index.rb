get '/' do
  erb :'users/new'
end

get '/login' do
  erb :login
end

post '/' do
  @user = User.find_by(username: params['user'][:username])
  if @user && @user.authenticate(params['user'][:password])
    session[:user_id] = @user.id
    erb :"users/show"
  else
    @errors = ["Something went wrong, just like it always does"]
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
