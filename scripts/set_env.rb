require 'json'
url = 'http://169.254.169.254/latest/meta-data/iam/security-credentials/'
role = `curl #{url}`
doc = `curl #{url}/#{role}/`

creds = JSON.parse(doc)
File.open('creds', 'w') do |file|
  file.write("export AWS_KEY=\"#{creds['AccessKeyId']}\"\n")
  file.write("export AWS_SECRET=\"#{creds['SecretAccessKey']}\"")
  file.write("export BUCKET=\"s3://2wtechconnectphoto\"")
  file.write("export SITE=\"s3://2wtechconnectsite\"")
end
