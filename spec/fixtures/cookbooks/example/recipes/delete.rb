# Delete two certificates from the OS certificate store

trusted_certificate 'Company Custom CA' do
  certificate_name 'custom_root_ca'
  action :delete
end

trusted_certificate 'Web Server (self-signed)' do
  certificate_name 'self_signed_example'
  action :delete
end
