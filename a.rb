upid=File.read("tmp/pids/unicorn.pid").to_i
Process.kill("KILL",upid)