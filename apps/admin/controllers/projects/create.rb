module Admin::Controllers::Projects
  class Create
    include Admin::Action

    params do
      required(:project).schema do
        required(:name).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        ProjectRepository.new.create(params[:project])

        flash[:message] = 'Project added!'
        redirect_to routes.projects_url
      else
        self.status = 422
      end
    end
  end
end
