require 'aws-sdk'

s3 = Aws::S3::Client.new(region: 'us-east-1')
photos = s3.list_objects(bucket: '2wtechconnectphoto')

photos.each do |photo|
  
end
