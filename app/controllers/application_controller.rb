
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get 'articles' do
    @articles = Articles.all
    erb :index
  end
  
  get '/articles/new' do 
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
  end
end
