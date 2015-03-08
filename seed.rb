require 'pry'
require_relative './lib/connection'
require_relative './lib/albums'
require_relative './lib/artists'
require_relative './lib/songs'

phoneix = Artist.create({
	name: "Kanye West"
})

album1 = Album.create({
	name: "Graduation",
	artist_id: west.id
	})

Song.create({
	title: "Good Morning",
	album_id: album1.id
	})

Song.create({
	title: "Can't Tell Me Nothing",
	album_id: album1.id
	})
Song.create({
	title: "Homecoming",
	album_id: album1.id
	})
