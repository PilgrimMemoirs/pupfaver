

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

  if @user = User.authenticate(@name, params[:password])
    session[:user_id] = @user.id
    redirect 'dogs/show'
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
  if @user.save
    session[:user_id] = @user.id
    redirect '/dogs'
  else
    erb :'/users/new'
  end
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

