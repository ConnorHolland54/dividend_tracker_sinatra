require './config/environment'


use Rack::MethodOverride
use StockController
run ApplicationController
