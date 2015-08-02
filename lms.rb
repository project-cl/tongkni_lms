require 'savon'

lms_user = '****'
lms_password = '****'

title = "title"
msg = "msg"

h = Hash.new
h["senderPhone"] = "********"
h["receivePhone"] = "********"

hash_value = Digest::MD5.hexdigest(lms_user + lms_password + h["receivePhone"])
h["hashValue"] = hash_value
h["lmsContent"] = msg
h["lmsID"] = lms_user
h["lmsTitle"] = title

client = Savon.client(wsdl: "http://lmsservice.tongkni.co.kr/lms.1/ServiceLMS.asmx?WSDL")
client.call :send_lms, :message => h
