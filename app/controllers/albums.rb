post '/albums/:album_id/new_photo' do
	@photo = Photo.new(title: params[:title], file: params[:filename])
  if @photo.save
  	erb :photo
  else
  	redirect to('/')
  end
end

get '/albums/:album_id' do
# view photos in albums
	erb :album_photos
end