import express from 'express'
import graphqlHTTP from 'express-graphql'
import schema from './schema'
import User from './models/User'

root =
  viewer: (args, request) =>
    new User 'Jane Doe', 'mail@example.com'

graphqlMiddleware = graphqlHTTP
  schema: schema
  rootValue: root
  graphiql: true

app = express()
app.use '/graphql', graphqlMiddleware
app.listen 4000
