namespace :unicorn do
    desc "unicorn始める"
    task :start do
        sh "bundle exec unicorn -c config/unicorn.rb -D -E production"
    end
    
end
