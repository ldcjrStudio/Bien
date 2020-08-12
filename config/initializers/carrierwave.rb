CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAWJXTJY6QKTORMQXA',                        # required unless using use_iam_profile
      aws_secret_access_key: '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',                        # required unless using use_iam_profile
    #   use_iam_profile:       true,                         # optional, defaults to false
      
    }
    config.fog_directory  = 'bienreviewtest'                                      # required

  end