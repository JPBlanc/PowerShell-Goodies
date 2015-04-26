# Allow me to find my public IP using
# http://ipecho.net/plain).content
# Another site would be :
# http://ipecho.net/plain
Function MyIP
{
  (Invoke-WebRequest -URI http://ipecho.net/plain).content
}