post '/users' do
  @user = User.create(params[:user_info])
  session[:user_id] = @user.id
  redirect '/dogs'
end

<div class="container">
    <h2> Create an Account </h2>

  <form id="sign-up" action="/users" method="post">
    <input type="text" name="user_info[name]" placeholder="username">
    <input type="password" name="user_info[password]" placeholder="password">
    <input type="password2" name="password2" placeholder="password">
    <input type="submit" value="Get some puppies!">
  </form>
</div>

params = {
  user_info: {name: "", password: " "} ,
  password2: ""
}

# ------------------------------------------------------]

User.create(name: params[:name], password: params[:password])

<div class="container">
    <h2> Create an Account </h2>

  <form id="sign-up" action="/users" method="post">
    <input type="text" name="name" placeholder="username">
    <input type="password" name="password" placeholder="password">
    <input type="submit" value="Get some puppies!">
  </form>
</div>

params = { name: "", password: " "}
