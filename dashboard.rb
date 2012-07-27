require 'sinatra'
require 'pivotal-tracker'
require 'yaml'
require 'date'
require 'json'


get '/pt' do
  config = YAML.load_file("config.yaml")
  @pt_token = config["config"]["pt_token"]
  
  # set up PT project
  PivotalTracker::Client.token = @pt_token
  
  @projects = PivotalTracker::Project.all
  
  output = Hash.new
  output[:type] = "reverse"
  output[:percentage] = "hide"
  
  
  out_ar = Array.new
  
   @projects.each do |p|
     
       unless p.last_activity_at.nil?
         if p.last_activity_at > DateTime.now - 7 
         
           out_ar << {:value => p.stories.all.count.to_s, :label => p.name}
         end
       end
   
     end
    
  output["item"] = out_ar
  output.to_json
  
end
  
