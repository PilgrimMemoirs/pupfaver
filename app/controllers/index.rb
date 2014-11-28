

get '/' do
  @dogs = Dog.all
  erb :'/dogs/show'
end


#-------SESSIONS-------#
  #LOGIN PAGE
get '/sessions/new' do
  erb :'sessions/new'
end

  #LOGIN REQUEST
post '/sessions' do
  user = User.authenticate(params[:user][:name], params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect '/dogs'
  else
    @error = "Invalid email or password"
    erb :'/sessions/new'
  end
end

  #LOGOUT
delete '/sessions/:id' do

  session.clear
  redirect :'/sessions/new'
end

#---------USERS--------#

  #SIGNUP PAGE
get '/users/new' do
  erb :"/users/new"
end

  #SIGNUP REQUEST
post '/users' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/dogs'
end


#--------DOGS----------#

  #SHOW ALL DOGS
get '/dogs' do
  @dogs = Dog.all
  erb :'/dogs/show'
end

  #SHOW A DOG
get '/dogs/:id' do
  @dog = Dog.find(params[:id])
  erb :'/dogs/show'
end


  #CREATE NEW DOG PAGE
get '/dogs/new' do
  erb :'dogs/show'
end

post '/dogs' do
  @dog = Dog.new(params[:dog])
  erb :'dogs/show'
end

  #EDIT DOG
put '/dogs/:id/edit' do
  @dog = Dog.find(params[:id])
  erb :'/dogs/edit'
end

put '/dogs/:id' do
  dog = Dog.find(params[:id])
  dog.update(params[:dog])
end

  #REMOVE A DOG
delete '/dogs/:id' do
  @dog = Dog.find(params[:id])
  @dog.destroy

  redirect '/dogs'
end

