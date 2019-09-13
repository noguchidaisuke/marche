namespace :unicorn do
    desc "unicorn始める"
    task :start do
        sh "bundle exec unicorn -c config/unicorn.rb -D -E production"
    end
    desc "unnicorn殺す"
    task :stop do
        upid=File.read("tmp/pids/unicorn.pid").to_i
        Process.kill("KILL",upid)
    end
end
