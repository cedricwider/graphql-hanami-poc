require_relative 'query_type'

BlogSchema = GraphQL::Schema.define(query: QueryType)
