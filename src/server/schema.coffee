import {
  GraphQLSchema,
  GraphQLObjectType,
  GraphQLString
} from 'graphql'

UserType = new GraphQLObjectType
  name: 'UserType'
  fields:
    name:
      type: GraphQLString
    email:
      type: GraphQLString

QueryType = new GraphQLObjectType
  name: 'QueryType'
  fields:
    viewer:
      type: UserType

export default new GraphQLSchema
  query: QueryType
