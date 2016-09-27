module Api::Controllers::Graphql
  class Show
    include Api::Action

    def call(params)
      query_variables = params[:vairables] || {}
      self.body = JSON.generate(BlogSchema.execute(params[:query], variables: query_variables))
    end
  end
end
