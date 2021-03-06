class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  version "1.17" 
  homepage "https://github.com/rjnpnigrhi/homebrew-cloud_sql_proxy"
  url "https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64"
  sha256 "d5a6870959d1bdeefe390039b9f782d8af60bf06616590405dc8ead374d240ea"
  head "https://github.com/rjnpnigrhi/homebrew-cloud_sql_proxy.git"
  
  depends_on "go" => :build
  depends_on "git" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/rjnpnigrhi/homebrew-cloud_sql_proxy").install buildpath.children
    
    cd "src/github.com/rjnpnigrhi/homebrew-cloud_sql_proxy/cmd/cloud_sql_proxy" do
      system "go get"
      system "go build"
      system "mkdir bin"
      system "mv cloud_sql_proxy bin/cloud_sql_proxy"
      bin.install "bin/cloud_sql_proxy"
    end
  end
end
