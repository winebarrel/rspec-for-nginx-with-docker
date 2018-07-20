namespace :spec do
  desc 'Make cert file'
  task 'make-cert', [:domain] do |t, args|
    cd 'spec/ssl' do
      sh 'docker-compose', 'run', '--rm', 'ca', './make-crt.sh', args.domain
    end
  end

  desc 'Clean reverse-proxy'
  task :clean do
    cd 'spec/reverse-proxy' do
      sh 'docker-compose', 'down', '-t', '0'
    end
  end

  desc 'Build reverse-proxy'
  task build: :clean do
    cd 'spec/reverse-proxy' do
      sh 'docker-compose', 'build'
    end
  end

  desc 'Test reverse-proxy config'
  task :configtest do
    cd 'spec/reverse-proxy' do
      sh 'docker-compose', 'run', '--rm', 'reverse-proxy', 'nginx', '-t'
      sh 'docker-compose', 'run', '--rm', 'elb', 'configtest'
    end
  end

  desc 'Test reverse-proxy'
  task :test do
    cd 'spec/reverse-proxy' do
      sh 'docker-compose', 'run', '--rm', 'taster', 'rspec', '-I.', '-r', 'spec_helper', '.'
    end
  end
end
