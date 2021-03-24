require './config/environment'


use Rack::MethodOverride
use UserController
use StockController
run ApplicationController
