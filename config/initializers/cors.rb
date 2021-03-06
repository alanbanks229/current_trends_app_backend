Rails.application.config.middleware.insert_before 0, Rack::Cors do 
    # allow do
    #   origins 'https://current-trends-app.herokuapp.com/'
    #   #initially http://localhost:3000
    # #  on deployment origins needs to be changed to current_trends_app.heroku.com/blablal
    #   resource '*',
    #     headers: :any,
    #     methods: [:get, :post, :put, :patch, :delete, :options, :head],
    #     credentials: true
    # end

    allow do
      origins 'http://localhost:3000'
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: false
    end

  end