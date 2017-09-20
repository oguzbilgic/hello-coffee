import babelPolyfill from 'babel-polyfill'
import server from './server'
import UsersController from './controllers/users'

resources =
  users: UsersController

server resources
