require_relative 'spec_helper'

describe port(8080) do
  it { should be_listening }
  its('processes') {should include 'java'}
end

repoconnection = 'http://localhost:8080'

describe command("curl #{repoconnection}/alfresco/") do
   its('stdout') { should match (/Welcome to Alfresco/) }
end

describe "Alfresco daemons" do
  let(:repoConnection) { $repoConnection ||= Helpers.getFaradayConnection "http://#{ENV["TARGET_HOST"]}:8080" }

  it 'Has a running Alfresco Repository Failing Test' do
    expect(repoConnection.get('/alfresco/').body).to include('Welcome to Alfresco11')
  end

  it 'Has a running Alfresco Repository application' do
    expect(repoConnection.get('/alfresco/').body).to include('Welcome to Alfresco')
  end
end
