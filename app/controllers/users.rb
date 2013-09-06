post '/users/new' do
  @new_user = User.create(params[:user])
  if @new_user.errors.full_messages.nil?
    @errors = @new_user.errors.full_messages
    erb :login
  else
  	Album.new(title: "#{@new_user.name}\'s First Album", user: @new_user)
    redirect to('/')
  end
end

get '/users/:id/albums' do
	@user = User.find(params[:id])
	@albums = @user.albums
	erb :albums
end