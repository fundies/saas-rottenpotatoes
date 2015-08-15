# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

	def create
		@movie = Movie.new(params[:movie])
		if @movie.save
		  flash[:notice] = "#{@movie.title} was successfully created."
		  redirect_to movies_path
		else
		  render 'new' # note, 'new' template can access @movie's field values!
		end
	end

	def show
	  id = params[:id] # retrieve movie ID from URI route
	  @movie = Movie.find(id) # look up movie by unique ID
    render(:partial => 'movie', :object => @movie) if request.xhr?
	  # will render app/views/movies/show.html.haml by default
	end

	def new
	  @movie = Movie.new
	end

	def edit
		@movie = Movie.find params[:id]
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end

	def update
		@movie = Movie.find params[:id]
		if @movie.update_attributes(params[:movie])
		  flash[:notice] = "#{@movie.title} was successfully updated."
		  redirect_to movie_path(@movie)
		else
		  render 'edit' # note, 'edit' template can access @movie's field values!
		end
	end

  def movies_with_filters
   @movies = Movie.with_good_reviews(params[:threshold])
    %w(for_kids with_many_fans recently_reviewed).each do |filter|
      @movies = @movies.send(filter) if params[filter]
    end
  end

  def search_tmdb
    @movies = Movie.find_in_tmdb(params[:search_terms])
    if @movies.empty?
      flash[:notice] = "'#{params[:search_terms]}' was not found in TMDb."
      redirect_to movies_path
    end
  end

end
