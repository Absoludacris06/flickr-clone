get '/' do
	@albums = Album.order("created_at DESC")
  erb :index
end