enable :sessions

get '/' do
  erb :index
end

post '/create' do
 user = User.create(params[:creation])
 session[:user] = user
 redirect('/secret')
end

get '/secret' do
  if session[:user]
    erb :secret
  else
    erb :index
  end
end

post '/' do
  if params[:logout]
    session[:user] = nil
    erb :index
  elsif params[:email] && params[:password]
    authentication = User.authenticate(params[:email], params[:password])
    if authentication
      session[:user] = authentication
      redirect('/secret')
    else
      redirect('/')
    end
  end
end
# params[creation] = { user_name: <whatever they said>, }
# User.create(params[creation])
