require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/albums'
require_relative './lib/artists'
require_relative './lib/songs'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
	erb :index
end

get '/artists' do
	erb :"artists/index", locals: { artists: Artist.all() }
end

post '/artist' do
	artist = {
		name: params["name"]
	};
	Artist.create(artist)
	erb :"artists/index", locals: { artists: Artist.all() }
end

get '/artist/:id' do
	artist = Artist.find_by({id: params[:id]})
	erb :"artists/show", locals: {artist: artist}
end

post '/album' do
	album = {
		name: params["name"],
		artist_id: params["artist_id"].to_i
	}
	Album.create(album)
	artist = Artist.find_by({id: params["artist_id"].to_i})
	erb :"artists/show", locals: {artist: artist}
end

get '/album/:id' do
	album = Album.find_by({id: params[:id]})
	erb :"albums/show", locals: {album: album}
end

post '/song' do
	song = {
		title: params["title"],
		album_id: params["album_id"]
	}
	Song.create(song)
	redirect ('/album/' + params["album_id"])
	album = Album.find_by({id: params["album_id"]})
	erb :"albums/show", locals: {album: album}
end
