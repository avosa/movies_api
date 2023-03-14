class MoviesController < ApplicationController
  def index
    genre = params[:genre]
    offset = params[:offset] || 0
    limit = params[:limit] || 10
    max_retries = 3

    movie_ids = fetch_movie_ids(genre, offset, limit, max_retries)
    movies, errors = fetch_movie_details(movie_ids, max_retries)
    total = movie_ids.size

    render json: { data: { movies: movies }, metadata: { offset: offset, limit: limit, total: total }, errors: errors }
  end

  private

  def fetch_movie_ids(genre, offset, limit, max_retries)
    retries = 0
    begin
      response = HTTParty.get("#{ENV['MOVIE_SERVICE_URL']}/movies?genre=#{genre}&offset=#{offset}&limit=#{limit}")
      movie_ids = response.parsed_response["data"]
    rescue => e
      retries += 1
      if retries <= max_retries
        sleep 2
        retry
      else
        raise StandardError.new("Error connecting to movie service: #{e.message}")
      end
    end
    movie_ids
  end

  def fetch_movie_details(movie_ids, max_retries)
    movies = []
    errors = []
    movie_ids.each do |id|
      retries = 0
      begin
        response = HTTParty.get("#{ENV['MOVIE_INFO_SERVICE_URL']}/movies/#{id}")
        movie = response.parsed_response["data"]["movie"]
      rescue => e
        retries += 1
        if retries <= max_retries
          sleep 2
          retry
        else
          errors << { errorCode: 450, message: "Error connecting to movie info service - #{e.message}" }
        end
      end

      retries = 0
      begin
        response = HTTParty.get("#{ENV['ARTIST_INFO_SERVICE_URL']}/movies/#{id}/cast")
        movie[:cast] = response.parsed_response["data"]["cast"]
      rescue => e
        retries += 1
        if retries <= max_retries
          sleep 2
          retry
        else
          errors << { errorCode: 440, message: "Error connecting to artist info service - #{e.message}" }
        end
      end

      movies << movie
    end
    [movies, errors]
  end
end
