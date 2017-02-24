require 'sinatra'

# Docker fixe
set :bind, '0.0.0.0'

# Class
require './classes/article_class'

# Routes
require './routes/article'
