# fichier de test pour le deployement de testDeploy

set :application, "test deploy"                                                                 # nom de l'application
set :repository, "git://github.com/alienmorphe/testDeploy.git "                                    # adresse du repositorie sur github

set :deploy_to, "/vhome/vhosts/preprod.kantik.net/htdocs/olivier/test_deploy_preprod"                       # endroit ou deployé le projet sur le serveur
set :scm, :git 
set :scm_verbose, true
set :spinner_user, nil
set :use_sudo, false
default_run_options[:pty] = true
set :user, "root"     
set :branch, "preprod"                                                                          # nom de l'utilisateur 

role :web, "88.191.95.145"
role :app, "88.191.95.145"                                                                      #serveur preprod
role :db, "88.191.95.145", :primary => true

# desc "This will deploy the app"
# task :after_update_code, :roles => [:app, :db, :web] do
  # run <<-CMD
  #   ln -nfs
  # CMD
  # run "ln -nfs #{shared_path}/photos #{current_path}/photos"
# end
namespace :deploy do
  # Overwritten to provide flexibility for people who aren't using Rails.
  task :setup, :except => { :no_release => true } do
    dirs = [deploy_to, releases_path, shared_path, cache_path, media_path]
    dirs += %w(system).map { |d| File.join(shared_path, d) }
    run "umask 02 && mkdir -p #{dirs.join(' ')}"
  end

  # Also overwritten to remove Rails-specific code.
  task :finalize_update, :except => { :no_release => true } do
    run "chmod -R g+w #{release_path}" if fetch(:group_writable, true)
    #run "ln -s /vhome/vhosts/dev.kantik.net/htdocs/olivier/test_deploy/asset/images #{release_path}/images"
    #run "cd #{shared_path}"
  end
  
  # create a symlink for the pictures
  task :create_symlink_pictures, :except => { :no_release => true } do
    #run "ln -s /vhome/vhosts/dev.kantik.net/htdocs/olivier/test_deploy/asset/images #{release_path}/images"
  end
  
  task :migrate do
  end

  task :migrations do
  end

  task :cold do
  end

  task :start do
  end

  task :stop do
  end

  # Do nothing (To restart apache, run 'cap deploy:apache:restart')
  task :restart do
  end

end 