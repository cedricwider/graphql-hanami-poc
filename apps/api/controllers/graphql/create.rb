module Api::Controllers::Graphql
  class Create
    include Api::Action

    def call(params)
      query = params[:query]
      query_variables = params[:vairables] || {}
      result = BlogSchema.execute(query, variables: query_variables)
      self.body = JSON.generate(result)
    end
  end
end
