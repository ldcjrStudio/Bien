CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'xxx',                        # required unless using use_iam_profile
      aws_secret_access_key: '123',                        # required unless using use_iam_profile
    #   use_iam_profile:       true,                         # optional, defaults to false
      
    }
    config.fog_directory  = 'bienreviewtest'                                      # required

  end