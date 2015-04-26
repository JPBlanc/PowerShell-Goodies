Function MyIP
{
  (Invoke-WebRequest -URI http://ipecho.net/plain).content
}