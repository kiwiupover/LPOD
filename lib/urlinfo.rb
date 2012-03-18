#/usr/bin/ruby

require "cgi"
require "base64"
require "openssl"
require "digest/sha1"
require "uri"
require "net/https"
require "rexml/document"
require "time"

#
# Sample request to Alexa Web Information Service
#

if ARGV.length < 3
  $stderr.puts "Usage: urlinfo.rb ACCESS_KEY_ID SECRET_ACCESS_KEY site"
  exit(-1)
else
  access_key_id = ARGV[0]
  secret_access_key = ARGV[1]
  site = ARGV[2]
end

SERVICE_HOST = "awis.amazonaws.com"

# escape str to RFC 3986
def escapeRFC3986(str)
  return URI.escape(str,/[^A-Za-z0-9\-_.~]/)
end

action = "UrlInfo"
responseGroup = "Rank,ContactInfo,LinksInCount,Keywords,UsageStats,TrafficData,ContentData"
timestamp = ( Time::now ).utc.strftime("%Y-%m-%dT%H:%M:%S.000Z")

query = {
  "Action"           => action,
  "AWSAccessKeyId"   => access_key_id,
  "Timestamp"        => timestamp,
  "ResponseGroup"    => responseGroup,
  "SignatureVersion" => 2,
  "SignatureMethod"  => "HmacSHA1",
  "Url"              => site
}


query_str = query.sort.map{|k,v| k + "=" + escapeRFC3986(v.to_s())}.join('&')

sign_str = "GET\n" + SERVICE_HOST + "\n/\n" + query_str 

puts "String to sign:\n#{sign_str}\n\n"

signature = Base64.encode64( OpenSSL::HMAC.digest( OpenSSL::Digest::Digest.new( "sha1" ), secret_access_key, sign_str)).strip
query_str += "&Signature=" + escapeRFC3986(signature)

url = URI.parse("http://" + SERVICE_HOST + "/?" + query_str)

puts "Making request to:\n#{url}\n\n"

xml  = REXML::Document.new( Net::HTTP.get(url) )

print "Response:\n\n"
print "Links in count: "
REXML::XPath.each(xml,"//aws:LinksInCount"){|el| puts el.text}
print "Rank: "
REXML::XPath.each(xml,"//aws:Rank"){|el| puts el.text}
puts xml

