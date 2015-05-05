# RegEx-MultiLine01.ps1

Clear-Host

$a =Get-Content 'D:\temp\M.xml' -raw 
$reg = [regex]'(?sm)(  <child1.*?</child1>)'
$tagMatches = $reg.Matches($a)

$blRemoved = $true
while ($blRemoved)
{
  $tagMatches = $reg.Matches($a)
  $blRemoved = $false
  foreach ($tagMatch in $tagMatches)
  {
    if ($tagMatch.value -notlike "*`"C`"*")
    {
      Write-Host $tagMatch.value
      $a = $a.Remove($tagMatch.Index,$tagMatch.Length+4)
      $blRemoved = $true
      break
    }
  }
}

$a