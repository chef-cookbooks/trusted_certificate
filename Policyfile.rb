# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'trusted_certificate'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'trusted_certificate::default'

# Specify a custom source for a single cookbook:
cookbook 'trusted_certificate', path: '.'
cookbook 'test', path: './test/fixtures/cookbooks/test'

# Create named run list entries for each of the tests
tests = (Dir.entries('./test/fixtures/cookbooks/test/recipes').select { |f| !File.directory? f })
tests.each do |test|
  test = test.gsub('.rb', '')
  named_run_list :"#{test.to_sym}", "test::#{test}"
end

